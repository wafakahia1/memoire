package iss4u.ehr.backoffice.parameterization.structure.controllers;

import iss4u.ehr.backoffice.parameterization.structure.entities.Service;
import iss4u.ehr.backoffice.parameterization.structure.entities.Site;
import iss4u.ehr.backoffice.parameterization.structure.services.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/parameterization/site")
public class SiteController {

    @Autowired
    private SiteService siteService;

    @PostMapping
    public ResponseEntity<Site> createSite(@RequestBody Site site) {
        siteService.create(site);
        return new ResponseEntity<>(site, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Site>> getAllSites() {
        List<Site> sites = siteService.retrieveSites();
        return new ResponseEntity<>(sites, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Site> getSiteById(@PathVariable("id") Long siteId) {
        Optional<Site> site = siteService.getSiteByKy(siteId);
        return site.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @GetMapping("/SiteName/{siteNm}")
    public ResponseEntity<Site> getSiteBySiteNm(@PathVariable("siteNm") String siteNm) {
        Site site = siteService.getSiteByNm(siteNm);
        if (site != null) {
            return new ResponseEntity<>(site, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/{siteKey}/name")
    public String getSiteNameByKey(@PathVariable("siteKey") Long siteKey) {
        return siteService.getSiteNameByKey(siteKey);
    }

    @PutMapping("/{siteKy}")
    public ResponseEntity<Site> updateSite(@PathVariable Long siteKy, @RequestBody Site updatedSite) {
        try {
            siteService.update(siteKy, updatedSite);
            return ResponseEntity.ok().build(); // Return 200 (OK) without a body
        } catch (EntityNotFoundException ex) {
            return ResponseEntity.notFound().build();
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<HttpStatus> deleteSite(@PathVariable("id") Long siteId) {
        Optional<Site> existingSite = siteService.getSiteByKy(siteId);
        if (existingSite.isPresent()) {
            siteService.delete(siteId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/{id}/child-elements")
    public ResponseEntity<List<Service>> getChildElements(@PathVariable("id") Long siteId) {
        Optional<Site> site = siteService.getSiteByKy(siteId);
        if (site.isPresent()) {
            List<Service> childElements = siteService.getChildElements(site.get());
            return new ResponseEntity<>(childElements, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/{id}/child-elements")
    public ResponseEntity<HttpStatus> addChildElement(@PathVariable("id") Long siteId, @RequestBody Service service) {
        Optional<Site> site = siteService.getSiteByKy(siteId);
        if (site.isPresent()) {
            siteService.addChildElement(site.get(), service);
            return new ResponseEntity<>(HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
