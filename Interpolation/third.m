function varargout = third(varargin)
% THIRD MATLAB code for third.fig
%      THIRD, by itself, creates a new THIRD or raises the existing
%      singleton*.
%
%      H = THIRD returns the handle to a new THIRD or the handle to
%      the existing singleton*.
%
%      THIRD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THIRD.M with the given input arguments.
%
%      THIRD('Property','Value',...) creates a new THIRD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before third_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to third_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help third

% Last Modified by GUIDE v2.5 22-Mar-2016 09:56:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @third_OpeningFcn, ...
                   'gui_OutputFcn',  @third_OutputFcn, ...
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


% --- Executes just before third is made visible.
function third_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to third (see VARARGIN)
axes(handles.axes1);
imshow(imread('h.jpg'));
image=importdata('h.jpg');
image1=importdata('h.jpg');
image2=importdata('h.jpg');
image3=importdata('h.jpg');
image4=importdata('h.jpg');
image5=importdata('h.jpg');
set(handles.ok1,'cdata',image);
set(handles.ok2,'cdata',image1);
set(handles.ok3,'cdata',image2);
set(handles.ok4,'cdata',image3);
set(handles.ok5,'cdata',image4);
set(handles.ok6,'cdata',image4);
% Choose default command line output for third
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes third wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = third_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ok1.
function ok1_Callback(hObject, eventdata, handles)
% hObject    handle to ok1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close;
legendre;

% --- Executes on button press in ok2.
function ok2_Callback(hObject, eventdata, handles)
% hObject    handle to ok2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close;
guass_chebyshev;

% --- Executes on button press in ok3.
function ok3_Callback(hObject, eventdata, handles)
% hObject    handle to ok3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close;
second;


% --- Executes on button press in ok4.
function ok4_Callback(hObject, eventdata, handles)
% hObject    handle to ok4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close;
singular;


% --- Executes on button press in ok5.
function ok5_Callback(hObject, eventdata, handles)
% hObject    handle to ok5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close;
singular2;


% --- Executes on button press in ok6.
function ok6_Callback(hObject, eventdata, handles)
% hObject    handle to ok6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close;
singular_chebyshev;