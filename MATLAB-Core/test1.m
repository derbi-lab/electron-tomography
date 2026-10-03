fid = fopen('points.txt');
fid1 = fopen('newpoints.txt');
tline = fgets(fid);
tline = fgets(fid);
tline = fgets(fid);
while ischar(tline)
    %fwrite(fid1,tline);
    disp(tline)
    tline = fgets(fid);
fwrite(fid1,tline);
end

fclose(fid);
fclose(fid1);
