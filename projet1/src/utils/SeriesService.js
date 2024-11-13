import Interceptor from "./axios-utils";

export const getSeriesByStudyId = (id) => {
    return new Promise((resolve, reject) => {
        Interceptor({
            url: "/Objct/getbySeries/" + id,
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

export const getImgPathById = (id) => {
    return new Promise((resolve, reject) => {
        Interceptor({
            url: "/Objct/seriesObjctPath/" + id,
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
