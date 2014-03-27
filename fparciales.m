function varargout = fparciales(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fparciales_OpeningFcn, ...
                   'gui_OutputFcn',  @fparciales_OutputFcn, ...
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

function fparciales_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);





function varargout = fparciales_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function pushbutton1_Callback(hObject, eventdata, handles)

A= get(handles.edit1, 'String');
G= get(handles.edit10, 'String');
A=sym(A);
G=sym(G);
num=sym2poly(A);
den=sym2poly(G);
[r, p, k,] = residue(num,den);

set(handles.text20,'String',r);
set(handles.text21,'String',p);
set(handles.text22,'String',k);

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit10_Callback(hObject, eventdata, handles)

function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
