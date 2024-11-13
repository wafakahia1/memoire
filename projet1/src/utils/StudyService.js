import Interceptor from "./axios-utils";

export const getStudyById = (id) => {
    return new Promise((resolve, reject) => {
        Interceptor({
            url: "/radiography/study/" + id,
            method: 'GET',
        })
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                reject(error);
            });
    });
};

// whre the obj (img) is directly associed to a study
export const getObjPathByStudyId = (id) => {
    return new Promise((resolve, reject) => {
        Interceptor({
            url: "/Objct/studyObjctPath/" + id,
            method: 'GET',
        })
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                reject(error);
            });
    });
};

export const getSeriesByStudyKy = (id) => {
    return new Promise((resolve, reject) => {
        Interceptor({
            url: "/radiography/study/allSeries/" + id,
            method: 'GET',
        })
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                reject(error);
            });
    });
};

export const getSeriesObjPathBySeriesKy = (id) => {
    return new Promise((resolve, reject) => {
        Interceptor({
            url: "/radiography/series/object-paths/" + id,
            method: 'GET',
        })
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                reject(error);
            });
    });
};
