function varargout = sistsegundo(varargin)
% SISTSEGUNDO MATLAB code for sistsegundo.fig
%      SISTSEGUNDO, by itself, creates a new SISTSEGUNDO or raises the existing
%      singleton*.
%
%      H = SISTSEGUNDO returns the handle to a new SISTSEGUNDO or the handle to
%      the existing singleton*.
%
%      SISTSEGUNDO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SISTSEGUNDO.M with the given input arguments.
%
%      SISTSEGUNDO('Property','Value',...) creates a new SISTSEGUNDO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sistsegundo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sistsegundo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sistsegundo

% Last Modified by GUIDE v2.5 18-Dec-2012 13:28:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sistsegundo_OpeningFcn, ...
                   'gui_OutputFcn',  @sistsegundo_OutputFcn, ...
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


% --- Executes just before sistsegundo is made visible.
function sistsegundo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sistsegundo (see VARARGIN)

% Choose default command line output for sistsegundo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sistsegundo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sistsegundo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function [obtNum,obtDen] = ArmarCocientes (num,den)

[token, remain] = strtok(den, '+');
a=strfind(token, 's^2');
if size(a)==0
    disp('El sistema no es de segundo orden')
    return;
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

obtNum=[str2double(num)];
obtDen=[a2 a1 a0];

function [tSubida,tPico, eMax, tAsentamiento] = datos (obtNum,obtDen)

t=0:0.001:5;
[y,x,t]= step(obtNum,obtDen,t);
r=1;
while y(r)<1.0001; 
    r=r+1;
end
tSubida=(r-1)*0.001;

[ymax,tp] = max(y);
tPico=(tp-1)*0.001;

eMax=ymax-1

s=5001; 
while y(s)>0.98 & y(s) <1.02;s=s-1; end;
tAsentamiento= (s-1)*0.001

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
num=get(handles.edit1,'string');
den=get(handles.edit2,'string');
[obtNum,obtDen]=ArmarCocientes(num,den);
t=0:0.02:10;
sys=tf(obtNum,obtDen)
impulse(sys,t);
title('Sistema con Respuesta Impulso Unitario')
[tSubida,tPico,eMax, tAsentamiento]=datos(obtNum,obtDen)
tsu=num2str(tSubida);
tpi=num2str(tPico);
elmax=num2str(eMax);
tase=num2str(tAsentamiento);
set(handles.text8,'String',tsu);
set(handles.text9,'String',tpi);
set(handles.text11,'String',elmax);
set(handles.text12,'String',tase);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
num=get(handles.edit1,'string');
den=get(handles.edit2,'string');
[obtNum,obtDen]=ArmarCocientes(num,den);
t=0:0.02:10;
sys=tf(obtNum,obtDen)
step(sys,t);
title('Sistema con Respuesta Escalon Unitario')
[tSubida,tPico,eMax, tAsentamiento]=datos(obtNum,obtDen)
tsu=num2str(tSubida);
tpi=num2str(tPico);
elmax=num2str(eMax);
tase=num2str(tAsentamiento);
set(handles.text8,'String',tsu);
set(handles.text9,'String',tpi);
set(handles.text11,'String',elmax);
set(handles.text12,'String',tase);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
num=get(handles.edit1,'string');
den=get(handles.edit2,'string');
[obtNum,obtDen]=ArmarCocientes(num,den);
c=length(obtDen);
obtDen(c+1)=0;
t=0:0.02:10;
sys=tf(obtNum,obtDen)
c=step(sys,t);
plot(t,c,'-',t,t,'-')
title('Sistema con Respuesta Rampa Unitaria')
grid
[tSubida,tPico,eMax, tAsentamiento]=datos(obtNum,obtDen)
tsu=num2str(tSubida);
tpi=num2str(tPico);
elmax=num2str(eMax);
tase=num2str(tAsentamiento);
set(handles.text8,'String',tsu);
set(handles.text9,'String',tpi);
set(handles.text11,'String',elmax);
set(handles.text12,'String',tase);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
num=get(handles.edit1,'string');
den=get(handles.edit2,'string');
[obtNum,obtDen]=ArmarCocientes(num,den);
r=roots(obtDen);
sys=tf(obtNum,obtDen)

rl=real(r);
i=imag(r);
plot(rl,i,'*r')
title('Polos de la funcion de transferencia')



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
