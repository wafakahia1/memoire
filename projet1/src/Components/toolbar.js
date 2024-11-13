import { CineDialog, Icon, LayoutButton, QuickSwitch } from "react-viewerbase";
import { useEffect, useState } from "react";
import React from 'react';
import html2canvas from "html2canvas";
import download from "downloadjs";
import {
  getObjPathByStudyId,
  getSeriesByStudyKy,
  getSeriesObjPathBySeriesKy,
} from "../utils/StudyService";
import cornerstone from 'cornerstone-core';

const Modal = ({ isOpen, onClose, contentLabel, children }) => {
  const modalStyle = {
    position: 'fixed',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    backgroundColor: '#fff',
    padding: '20px',
    zIndex: 999,
    display: isOpen ? 'block' : 'none',
  };

  return (
    <>
      {isOpen && (
        <div style={modalStyle}>
          <h2>{contentLabel}</h2>
          {children}
          <button onClick={onClose}>Close</button>
        </div>
      )}
    </>
  );
};

const Toolbar = ({ state, setState, id, type }) => {
  const height = 580;
  const width = 100;
  const dcmProtocal = "dicomweb://";

  // const [seriesArray, setSeriesArray] = useState([])
  const [studies, setStudies] = useState([
    {
      thumbnails: [],
    },
  ]);

  const [layout, setLayout] = useState({
    selectedCell: {
      col: 0,
      row: 0,
    },
  });

  const [isDicomHeaderModalOpen, setDicomHeaderModalOpen] = useState(false);
  const [dicomHeader, setDicomHeader] = useState(null);

  const printDicomHeader = () => {
    const activeViewportIndex = state.activeViewportIndex;
    const enabledElements = cornerstone.getEnabledElements();

    if (enabledElements.length > activeViewportIndex) {
      const activeElement = enabledElements[activeViewportIndex];

      if (activeElement && activeElement.image) {
        const activeImageId = activeElement.image.imageId;

        // Use cornerstone.metaData.get to retrieve metadata
        const metaData = cornerstone.metaData.get('imagePlaneModule', activeImageId);
        setDicomHeader(metaData);
        setDicomHeaderModalOpen(true);
      }
    }
  };

  const closeDicomHeaderModal = () => {
    setDicomHeaderModalOpen(false);
  };



//  const handleModalityChange = (selectedModality) => {
   // console.log(`Switching to modality: ${selectedModality}`);
 // };

 useEffect(() => {
  const thumbnails = [];

  const fetchData = async () => {
    if (type === "Study") {
      // GETTING APIS AND PUTTING THE INFORMATION INTO UseState
      const objArray = await getObjPathByStudyId(id);
      objArray.forEach((objPath) => {
        // SETTING THE SERIES WITH INFORMATIONS FROM THE API
        thumbnails.push({
          imageSrc:
            "https://raw.githubusercontent.com/crowds-cure/cancer/master/public/screenshots/Anti-PD-1_Lung.jpg",
          seriesDescription: "none",
          active: true,
          seriesNumber: 1,
          numImageFrames: null,
          stackPercentComplete: null,
          ObjctVerionsPath: [dcmProtocal + objPath],
        });
      });

      const Series = await getSeriesByStudyKy(id);
      Series.forEach(async (s) => {
        let objList = [];

        const obj = await getSeriesObjPathBySeriesKy(s.seriesKy);
        obj.forEach((path) => {
          objList.push(dcmProtocal + path);
        });

        thumbnails.push({
          imageSrc:
            "https://raw.githubusercontent.com/crowds-cure/cancer/master/public/screenshots/Anti-PD-1_Lung.jpg",
          seriesDescription: s.seriesDesc,
          active: true,
          seriesNumber: 1,
          numImageFrames: null,
          stackPercentComplete: null,
          ObjctVerionsPath: objList,
          serieID: s.seriesKy,
        });
      });
    } else {
      const Series = await getSeriesByStudyKy(id);
      Series.forEach(async (s) => {
        let objList = [];
        const obj = await getSeriesObjPathBySeriesKy(s.seriesKy);
        obj.forEach((path) => {
          objList.push(dcmProtocal + path);
        });

        thumbnails.push({
          imageSrc:
            "https://raw.githubusercontent.com/crowds-cure/cancer/master/public/screenshots/Anti-PD-1_Lung.jpg",
          seriesDescription: s.seriesDesc,
          active: true,
          seriesNumber: 10,
          numImageFrames: null,
          stackPercentComplete: null,
          ObjctVerionsPath: objList,
          serieID: s.seriesKy,
        });
      });
    }
    // AFTER PUTTING SERIES INTO THE ARRAY OBJECT WE PUSH IT TO ONE BIG OBJECT
    const studyResult = [{ thumbnails }];
    setStudies(studyResult);
  };

  fetchData();
}, [id, type, dcmProtocal, getObjPathByStudyId, getSeriesByStudyKy, getSeriesObjPathBySeriesKy, setStudies]);


  useEffect(() => {
    handleLayoutCell();
  }, [layout]);

  const handleSelectTool = (tool) => {
    setState((prevState) => ({ ...prevState, activeTool: tool }));
  };

  const handleLayoutCell = () => {
    let table = [];
    let Row = layout.selectedCell.row + 1;
    let Col = layout.selectedCell.col + 1;
    let numViewports = Row * Col;
  //  let newRow;
  //  let newCol;

    for (let i = 0; i < numViewports; i++) {
      table.push(i);
    }
    for (let row = 0; row < layout.selectedCell.row + 1; row++) {
      //newRow = row;
      for (let col = 0; col < layout.selectedCell.col + 1; col++) {
        //newCol = col;
      }
    }
    setState((prevState) => ({ ...prevState, width: width / Col }));
    setState((prevState) => ({ ...prevState, height: height / Row }));
    setState((prevState) => ({ ...prevState, viewports: table }));
  };

  const toggleDisplayCine = () => {
    setState((prevState) => ({
      ...prevState,
      displayCine: !state.displayCine,
    }));
  };



  function handleCinePlay() {
    setState((prevState) => ({ ...prevState, isPlaying: !state.isPlaying }));
  }

  const toggle3d2dViewer = () => {
    if (state.serieId) {
      window.open("http://localhost:4202/" + state.serieId, "_blank");
    }
  };

  async function downloadPng(id, filename) { 
    console.log(id,filename);
    const el = document.getElementById(id);
    const canvas = await html2canvas(el);
    const png = canvas && canvas.toDataURL("image/png");
    download(png, `${filename}.png`, "image/png");
  }

  return (
    <>
      <div className="ToolbarSection">
        <div
          className={`toolbar-button ${state.activeTool === "Probe" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Probe")}
        >
          <Icon name="dot-circle" />
          <div className="toolbar-button-label">Probe</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "Pan" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Pan")}
        >
          <Icon name={"arrows"} />

          <div className="toolbar-button-label">Pan</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "Wwwc" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Wwwc")}
        >
          <Icon name={"level"} />

          <div className="toolbar-button-label">Level</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "Zoom" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Zoom")}
        >
          <Icon name={"search-plus"} />

          <div className="toolbar-button-label">Zoom</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "Bidirectional" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Bidirectional")}
        >
          <Icon name={"measure-target"} />

          <div className="toolbar-button-label">Bidirect</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "StackScroll" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("StackScroll")}
        >
          <Icon name={"bars"} />

          <div className="toolbar-button-label">Scroll</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "ResetViewport" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("ResetViewport")}
        >
          <Icon name={"reset"} />
          <div className="toolbar-button-label">Reset</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "Magnify" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Magnify")}
        >
          <Icon name={"circle"} />
          <div className="toolbar-button-label">Magnify</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "Angle" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Angle")}
        >
          <Icon name={"angle-double-up"} />
          <div className="toolbar-button-label">Angle</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "ArrowAnnotate" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("ArrowAnnotate")}
        >
          <Icon name={"measure-non-target"} />
          <div className="toolbar-button-label">Annot</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "Length" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Length")}
        >
          <Icon name={"arrows-alt-v"} />
          <div className="toolbar-button-label">Length</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "EllipticalRoi" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("EllipticalRoi")}
        >
          <Icon name={"circle-o"} />
          <div className="toolbar-button-label">Ellip ROI</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "FreehandRoi" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("FreehandRoi")}
        >
          <Icon name={"circle-notch"} />
          <div className="toolbar-button-label">FH ROI</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "Rotate" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Rotate")}
        >
          <Icon name={"rotate"} />

          <div className="toolbar-button-label">Rotate</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "Eraser" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("Eraser")}
        >
          <Icon name={"trash"} />
          <div className="toolbar-button-label">Eraser</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "WwwcRegion" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("WwwcRegion")}
        >
          <Icon name={"stop"} />
          <div className="toolbar-button-label">Region</div>
        </div>

        <div
          className={`toolbar-button ${state.activeTool === "RectangleRoi" ? "active" : ""
            }`}
          onClick={() => handleSelectTool("RectangleRoi")}
        >
          <Icon name={"square-o"} />
          <div className="toolbar-button-label">Rect</div>
        </div>

        <div className="toolbar-button" onClick={() => toggleDisplayCine()}>
          <Icon name={"youtube"} />
          <div className="toolbar-button-label">CINE</div>
        </div>

        <div className="toolbar-button" onClick={() => printDicomHeader()}>
          <Icon name={"info"} />
          <div className="toolbar-button-label">Header</div>
        </div>

        {/* DICOM Header Modal */}
        <Modal
          isOpen={isDicomHeaderModalOpen}
          onClose={closeDicomHeaderModal}
          contentLabel="DICOM Header"
        >
          {dicomHeader && (
            <table>
              <thead>
                <tr>
                  <th>Field</th>
                  <th>Value</th>
                </tr>
              </thead>
              <tbody>
                {Object.entries(dicomHeader).map(([field, value]) => (
                  <tr key={field}>
                    <td>{field}</td>
                    <td>{JSON.stringify(value)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </Modal>




        <div
          className="toolbar-button"
          style={{ display: "block" }}
          onClick={() => toggle3d2dViewer()}
        >
          <Icon name={"cube"} />
          <div className="toolbar-button-label">3D</div>
        </div>

        <div
          className="toolbar-button"
          style={{ display: "block" }}
          onClick={() => downloadPng("Viewer-Container", "Study")}
        >
          <Icon name={"create-screen-capture"} />
          <div className="toolbar-button-label">Capture</div>
        </div>

        <LayoutButton
          onChange={(cell) => {
            setLayout({ selectedCell: cell });
            console.log(cell);
          }}
          onClick={() => handleLayoutCell()}
        />
      </div>

      {studies.length > 0 ? (
        <div style={{ paddingTop: "15px", marginLeft: "15px" }}>
          <QuickSwitch
            studyListData={studies}
            onSeriesSelected={(selectedSeries) => {
              setState((prevState) => ({
                ...prevState,
                imageIds: selectedSeries.ObjctVerionsPath,
              }));
              setState((prevState) => ({
                ...prevState,
                serieId: selectedSeries.serieID,
              }));
            }}
          />
        </div>
      ) : null}

      <div
        style={{
          zIndex: "999",
          position: "absolute",
          display: state.displayCine === false ? "block" : "none",
          top: "120px",
          left: "900px",
        }}
      >
        <CineDialog
          cineStepFrameRate={state.cineFrameRate}
          onPlayPauseChanged={() => handleCinePlay()}
        />
      </div>
    </>
  );
};
export default Toolbar;