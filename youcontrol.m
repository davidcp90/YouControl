function varargout = youcontrol(varargin)
% YOUCONTROL MATLAB code for youcontrol.fig
%      YOUCONTROL, by itself, creates a new YOUCONTROL or raises the existing
%      singleton*.
%
%      H = YOUCONTROL returns the handle to a new YOUCONTROL or the handle to
%      the existing singleton*.
%
%      YOUCONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YOUCONTROL.M with the given input arguments.
%
%      YOUCONTROL('Property','Value',...) creates a new YOUCONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before youcontrol_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to youcontrol_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help youcontrol

% Last Modified by GUIDE v2.5 18-Dec-2012 13:37:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @youcontrol_OpeningFcn, ...
                   'gui_OutputFcn',  @youcontrol_OutputFcn, ...
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


% --- Executes just before youcontrol is made visible.
function youcontrol_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to youcontrol (see VARARGIN)

% Choose default command line output for youcontrol
handles.output = hObject;
axes(handles.axes1);
bg = imread('control.png');
image(bg);
axis off; 

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes youcontrol wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = youcontrol_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
transla;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
sistprimer;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
sistsegundo;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
fparciales;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
ftransferencia;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
rpolinomio;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
ordsup;
