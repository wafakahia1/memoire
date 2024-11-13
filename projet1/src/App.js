
import './App.css';
import { useEffect } from "react";
import initCornerstone from "./config/cornerStoneCofig";
import Viewport2d from "./Components/viewport-2d";
import { useParams } from "react-router-dom";
import React from 'react';
//import cornerstoneWADOImageLoader from 'cornerstone-wado-image-loader';
import Header from "./Components/header";




function App() {
    const { type, id } = useParams();

    useEffect(() => {
        initCornerstone(); // Initialize Cornerstone (assuming this is required)
    }, []);

    return (
        <div className="App">
            {<Header />}
            <Viewport2d id={id} type={type} />
        </div>
    );
}

export default App;