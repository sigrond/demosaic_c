% This is a matlab script which needs avimex MEX file.
% The code was successfully used in Linux Mint 11 64bit with Matlab 2010b 64bit 
% and Windows 7 32 bit with Matlab 2008b 32bit.
% It's used to read a multiframe .avi video from AVT PIKE DS filter ADW6 
% (16 bit RAW format), 640 x 480 frames.
% 
% INPUT
% First argument is a name of input file (including .avi extension), Second is 
% a vector of frames to be read.
% 
% OUTPUT
% Outup is a 4 dimensional matrix (no of frame, height, width, RGB) of 
% uint16 numbers.
% 
% Without specifying the second argument the script is run from the begining
% to the end of the input file.
% 
% Script uses Matlab built-in demosaic function applied to the RAW 16 frames
% read frame by frame by avimex MEX file. 
% Beware that the transposition function is used, you also have to be sure to
% use the correct bayer pattern for your camera to display colors in a apropriate way.
% 
% If you would like to adjust this code to work with another codecs you should change 
% variable: "skok" which represents the size of a single frame in bytes.

function [mov]=AviReadPike_Split(name,zakres)
    skok = (640*480*2)+8;
    s=dir(name);
    if nargin < 2
        zakres=0:1:int32((s.bytes-34816)/skok);
    end
    if (nargin==2 && max(zakres)>int32((s.bytes-34816)/skok))
        stop=int32((s.bytes-34816)/skok);
    end
    mov=zeros(length(zakres),480,640,3,'uint16');
    for i=1:length(zakres)
		mov(i,:,:,:)=demosaic_c_mex((avimex_Split(name,int16(zakres(i))))','grbg');
    end   
end
