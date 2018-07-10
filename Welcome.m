function varargout = Welcome(varargin)
% WELCOME MATLAB code for Welcome.fig
%      WELCOME, by itself, creates a new WELCOME or raises the existing
%      singleton*.
%
%      H = WELCOME returns the handle to a new WELCOME or the handle to
%      the existing singleton*.
%
%      WELCOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WELCOME.M with the given input arguments.
%
%      WELCOME('Property','Value',...) creates a new WELCOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Welcome_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Welcome_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Welcome

% Last Modified by GUIDE v2.5 10-Jul-2018 17:26:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Welcome_OpeningFcn, ...
                   'gui_OutputFcn',  @Welcome_OutputFcn, ...
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


% --- Executes just before Welcome is made visible.
function Welcome_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Welcome (see VARARGIN)

% Choose default command line output for Welcome
handles.output = hObject;

% 设置整个窗口背景
h=axes('units','normalized','position',[0,0,1,1]);
uistack(h,'up');
i=imread('cover.jpg');
image(i);
set(h,'handlevisibility','off','visible','off');

set(handles.power1,'value',1);
set(handles.power2,'value',0);

addpath(genpath(pwd));

% set(handles.Btn_OK,'CData',i);
% set(handles.Btn_Exit,'CData',i);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Welcome wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Welcome_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Btn_OK.
function Btn_OK_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_OK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(get(handles.power1,'value'),1)
    Main;
elseif isequal(get(handles.power2,'value'),1)
    Main2;
elseif isequal(get(handles.inter,'value'),1)
    first;
end

% --- Executes on button press in Btn_Exit.
function Btn_Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

selection = questdlg('确定要退出系统？','提示','Yes','No','Yes');
if strcmp(selection,'No')
    return;
elseif strcmp(selection,'Yes')
    close;
    clc;
end


% --- Executes on button press in power1.
function power1_Callback(hObject, eventdata, handles)
% hObject    handle to power1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.power1,'value',1);
set(handles.power2,'value',0);
set(handles.inter,'value',0);
% Hint: get(hObject,'Value') returns toggle state of power1


% --- Executes on button press in power2.
function power2_Callback(hObject, eventdata, handles)
% hObject    handle to power2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.power1,'value',0);
set(handles.power2,'value',1);
set(handles.inter,'value',0);
% Hint: get(hObject,'Value') returns toggle state of power2


% --- Executes on button press in inter.
function inter_Callback(hObject, eventdata, handles)
% hObject    handle to inter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.power1,'value',0);
set(handles.power2,'value',0);
set(handles.inter,'value',1);
% Hint: get(hObject,'Value') returns toggle state of inter
