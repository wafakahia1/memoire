export interface Series {
    seriesKy: number;
    select: boolean;
    seriesPrntky: number;
    seriesDesc: string;
    seriesBodypart: string;
    seriesDcmmdlty: string;
    seriesCtdlvol: string;
    seriesDlp: string;
    seriesUnxtmcrt: Date;
    seriesUnxtmupdt: Date;
    seriesRcrdsts: number;
}

export interface StudyResponse {
    studyKy: number;
    select: boolean;
    studyPrntky: number;
    studyDesc: string;
    studyAccessnnmbr: string;
    studyCommnt: string;
    studyInsttnnm: string;
    studyRfrntphyscn: number;
    studyPrfrmngphyscn: number;
    studyAetitle: string;
    studyUnxtmcrt: Date;
    studyUnxtmupdt: Date;
    studyRcrdsts: number;
    series: Series[];
}
