function varargout = ordsup(varargin)
% ORDSUP MATLAB code for ordsup.fig
%      ORDSUP, by itself, creates a new ORDSUP or raises the existing
%      singleton*.
%
%      H = ORDSUP returns the handle to a new ORDSUP or the handle to
%      the existing singleton*.
%
%      ORDSUP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ORDSUP.M with the given input arguments.
%
%      ORDSUP('Property','Value',...) creates a new ORDSUP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ordsup_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ordsup_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ordsup

% Last Modified by GUIDE v2.5 18-Dec-2012 12:00:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ordsup_OpeningFcn, ...
                   'gui_OutputFcn',  @ordsup_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ordsup is made visible.
function ordsup_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ordsup (see VARARGIN)

% Choose default command line output for ordsup
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ordsup wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ordsup_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function [numerador,denominador] = cocientes (num,den)

[token, remain] = strtok(den, '^')
grado=str2double(remain(2))
r=grado
remain=den
while r>=0
    v=strcat('s^',num2str(r))
    [token, remain]= strtok(remain, '+')
    r=r-1
end

if a==1
    token='1';
else
    token= strtok(den, '*');
end

a2=str2double(token)

[token2, remain] = strtok(remain, '+');
b=strfind(token2, 's');
validador=0;
if size(b)==0
   a1=0
   if strcmp(token2,'')
       a0=0
       validador=1;
   else
       a0=str2double(token2)
       validador=1;
   end
elseif  b==1
    token2='1';
    a1=str2double(token2)
else
   token2=strtok(token2,'*');
   a1=str2double(token2)
end


if validador~=1
    if isempty(remain)
        a0=0
    else
        remain=remain(2:end);
        a0=str2double(remain)
    end
end

numerador=[str2double(num)];
denominador=[a2 a1 a0];



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
num=get(handles.text4,'string');
den=get(handles.text5,'string');
[numerador,denominador]=cocientes(num,den);
t=0:0.02:10;
sys=tf(numerador,denominador)
impulse(sys,t);
title('Sistema con entrada Impulso')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
num=get(handles.text4,'string');
den=get(handles.text5,'string');
[numerador,denominador]=cocientes(num,den);
t=0:0.02:10;
sys=tf(numerador,denominador)
ustep(sys,t);
title('Sistema con entrada Escalon')


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
num=get(handles.text4,'string');
den=get(handles.text5,'string');
[numerador,denominador]=cocientes(num,den);
t=0:0.02:10;
sys=tf(numerador,denominador)
step(sys,t);
title('Sistema con entrada Rampa')
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
