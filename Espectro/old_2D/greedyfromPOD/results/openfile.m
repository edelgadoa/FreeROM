function v=openfile(name)
fileID = fopen(name);
v=fscanf(fileID,'%f');
fclose(fileID);
v=v(2:end);