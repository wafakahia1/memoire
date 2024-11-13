
import { useEffect, useState } from "react";
import { getObjPathByStudyId, getSeriesByStudyKy, getSeriesObjPathBySeriesKy } from "../utils/StudyService";
import Toolbar from "./toolbar";
import React from 'react';
import CornerstoneViewport from 'react-cornerstone-viewport';




const Viewport2d = ({ id, type }) => {

    //Dicom Decoding Protocol
    const dcmProtocal = 'dicomweb://'
    const [objPathList, setObjPathList] = useState([]);
    let seriesId = null;

    const height = 602;
    const width = 100;

    const [state, setState] = useState(
        {
            activeViewportIndex: 0,
            viewports: [0],
            tools: [
                {
                    name: 'ScaleOverlay',
                    mode: 'active',
                    modeOptions: { mouseButtonMask: 1 },
                },
                // Mouse
                {
                    name: 'Wwwc',
                    mode: 'active',
                    modeOptions: { mouseButtonMask: 1 },
                },
                {
                    name: 'Zoom',
                    mode: 'active',
                    modeOptions: { mouseButtonMask: 2 }
                },
                {
                    name: 'Pan',
                    mode: 'active',
                    modeOptions: { mouseButtonMask: 4 },
                },
                //declaration
                {
                    id: 'ResetViewport',
                    title: 'Reset Viewport',
                    className: 'imageViewerCommand',
                    icon: 'reset',
                    mode: 'active',
                },
                {
                    name: 'Magnify',
                    mode: 'active',
                },
                {
                    name: 'Invert',
                    mode: 'active',
                },
                {
                    name: 'StackScroll',
                    mode: 'active',
                },
                {
                    name: 'Length',
                    mode: 'active',
                },
                {
                    name: 'Angle',
                    mode: 'active',
                    modeOptions: { mouseButtonMask: 1 },
                },
                {
                    name: 'ArrowAnnotate',
                    mode: 'active',
                },
                {
                    name: 'Probe',
                    mode: 'active',
                    modeOptions: { mouseButtonMask: 1 },
                },
                {
                    name: 'FreehandRoi',
                    mode: 'active',
                    modeOptions: { mouseButtonMask: 1 },
                },
                {
                    name: 'EllipticalRoi',
                    mode: 'active',
                    modeOptions: { mouseButtonMask: 1 },
                },
                {
                    name: 'Rotate',
                    mode: 'active',
                },
                {
                    name: 'WwwcRegion',
                    mode: 'active',
                    modeOptions: { mouseButtonMask: 1 },
                },
                {
                    name: 'Eraser',
                    mode: 'active',
                },
                {
                    name: 'Bidirectional',
                    mode: 'active',
                },
                {
                    name: 'Invert',
                    mode: 'active',
                    type: 'command',
                    commandName: 'invertViewport',
                },
                {
                    name: "RectangleRoi",
                    // toolClass: RectangleRoi,
                    mode: "active",
                },
                // Scroll
                { name: 'StackScrollMouseWheel', mode: 'active' },
                // Touch
                { name: 'PanMultiTouch', mode: 'active' },
                { name: 'ZoomTouchPinch', mode: 'active' },
                { name: 'StackScrollMultiTouch', mode: 'active' },

            ],
            imageIds: objPathList,
            // FORM
            activeTool: 'Wwwc',
            imageIdIndex: 0,
            displayCine: true,
            isPlaying: false,
            cineFrameRate: 10,
            height: height,
            width: width,
            display2D: true,
            display3D: false,
            isStackPrefetchEnabled: true,
            serieId: seriesId,
        }
    )

    useEffect(() => {
        // If the Selected Study have object or  series
        if (type === "Study") {
            //Getting the object of the Study
            getStudyObject();
            //Getting the object of the Series
            getSeriesObject();
        } else if (type === "Series") { // If Juste Series selected
            //Getting the objects of series study
            getSeriesObject();
        }


    }, [id]);

    const getStudyObject = () => {
        getObjPathByStudyId(id).then(result => {
            const objList = []

            result.forEach(o => {
                objList.push(dcmProtocal + o);
            });
            if (objList.length > 0) {
                setObjPathList(objList);
                setState(prevState => ({ ...prevState, imageIds: objList }));

            }
        });
    }
    const getSeriesObject = () => {
        //Getting the objects of series study
        getSeriesByStudyKy(id).then(Series => {

            if (Series.length >= 1) {
                for (let i = 0; i < Series.length; i++) {


                    seriesId = Series[i].seriesKy;
                    setState(prevState => ({ ...prevState, serieId: seriesId }));
                    // Getting the first series objects Path
                    getSeriesObjPathBySeriesKy(seriesId).then(obj => {
                        const objList = []

                        obj.forEach(o => {

                            const imgPath = dcmProtocal + o;
                            objList.push(imgPath);
                        });

                        if (objList.length > 0) {
                            setObjPathList(objList);
                            setState(prevState => ({ ...prevState, imageIds: objList }));

                        }

                    });
                }

            }


        });
    }

    return (
        <>
            <Toolbar state={state} setState={setState} id={id} type={type} />
            <div id="Viewer-Container" className="Viewer-Container">
                {state.viewports.map(viewportIndex => {
                    return state.imageIds.length > 0 ? (
                        <CornerstoneViewport
                            style={{
                                minWidth: (state.width) + '%',
                                minHeight: (state.height) + 'px',
                                flexWrap: 'wrap',
                                display: 'inline-block',
                                height: state.height + 'px',
                                width: state.width + '%',
                                borderColor: "#20a5d6"
                            }}
                            imageIdIndex={state.imageIdIndex}
                            key={viewportIndex}
                            tools={state.tools}
                            imageIds={state.imageIds}
                            activeTool={state.activeTool}
                            isPlaying={state.isPlaying}
                            frameRate={state.cineFrameRate}
                            className={state.activeViewportIndex === viewportIndex ? 'active' : ''}
                            setViewportActive={() => {
                                // this.setState({
                                //     activeViewportIndex: viewportIndex,
                                // });
                            }}
                            isStackPrefetchEnabled={true}
                        />
                    ) : null
                }
                )}
            </div>
        </>
    );
}
export default Viewport2d;
