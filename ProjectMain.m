% Reading in the image.
[org, map]= imread('duneLiDARs.png','png');
figure, imshow(org,map);

processImg(org);
