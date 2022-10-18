% Filename (ROI with DICOM metadata)
VarName_RoI = {'RoI_dcminfo_ID_001_CT2.dcm',... ,'RoI_dcminfo_ID_383_CT2.dcm'};

% Filename (The image(HU: 0 ~ 100) and ROI overlap)
VarName_0_100 = {'RoI_0_100_ID_001_CT2.dcm',...,'RoI_0_100_ID_383_CT2.dcm'};

% Filename (The image(HU: -29 ~ 150) and ROI overlap)
VarName_29_150 = {'RoI_-29_150_ID_001_CT2.dcm',...,'RoI_-29_150_ID_383_CT2.dcm'};


dirpath = 'Yourpath_dcm';  
dirinfo = dir(dirpath);
dirinfo(1:2)=[];  %remove . and ..
img = [];

dirpath_tiff = 'Yourpath_tiff';  
dirinfo_tiff = dir(dirpath_tiff);
dirinfo_tiff(1:2)=[];  %remove . and ..
img_tiff = [];

for i = 1:length(dirinfo)
    img_ori=dicomread([dirpath filesep dirinfo(i).name]);  % dicomread: read DICOM "image" matrix
    info=dicominfo([dirpath filesep dirinfo(i).name]);  % dicominfo: read DICOM metadata
    img_dcm=double(img_ori)*info.RescaleSlope+info.RescaleIntercept;  % convert image value to HU
    %figure,imshow(img_dcm,[])  
    
    img_tiff = imread([dirpath_tiff filesep dirinfo_tiff(i).name]); 
    img_tiff = img_tiff(:,:,1);
    %figure,imshow(img_tiff,[])
    
    ind=find(edge(img_tiff));  % ind: indices (locations) of boundary pixels
    img2=img_dcm;
    img2(ind)=max(img2(:));  % set values of boundary pixels to maximum of the whole image
    K = figure,imshow(img2,[0 100]);  % image display with muscle window
    saveas(K,['Yourpath_save',VarName_0_100{i},'.png']); 
    Q = figure,imshow(img2,[-29 150]);
    saveas(Q,['Yourpath_Save',VarName_29_150{i},'.png']) 
    
    img_mask=img_ori; 
    img_mask(img_tiff==0)=min(img_ori(:));  % set values of pixels that outside the selected ROI to minimum
    %figure,imshow(img_mask,[]) % image display with muscle window
    
    dicomwrite(img_mask,VarName_RoI{i},info);  
end