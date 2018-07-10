function varargout = singular(varargin)
% SINGULAR MATLAB code for singular.fig
%      SINGULAR, by itself, creates a new SINGULAR or raises the existing
%      singleton*.
%
%      H = SINGULAR returns the handle to a new SINGULAR or the handle to
%      the existing singleton*.
%
%      SINGULAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINGULAR.M with the given input arguments.
%
%      SINGULAR('Property','Value',...) creates a new SINGULAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before singular_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to singular_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help singular

% Last Modified by GUIDE v2.5 19-Mar-2016 15:45:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @singular_OpeningFcn, ...
                   'gui_OutputFcn',  @singular_OutputFcn, ...
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


% --- Executes just before singular is made visible.
function singular_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to singular (see VARARGIN)

% Choose default command line output for singular
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes singular wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = singular_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function f4_Callback(hObject, eventdata, handles)
% hObject    handle to f4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f4 as text
%        str2double(get(hObject,'String')) returns contents of f4 as a double
handlesOld=guidata(hObject);
handles.handlesOld=handlesOld;
guidata(hObject,handles);
handles=handles.handlesOld;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function f4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n4_Callback(hObject, eventdata, handles)
% hObject    handle to n4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n4 as text
%        str2double(get(hObject,'String')) returns contents of n4 as a double
handlesOld=guidata(hObject);
handles.handlesOld=handlesOld;
guidata(hObject,handles);
handles=handles.handlesOld;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function n4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ok1.
function ok1_Callback(hObject, eventdata, handles)
% hObject    handle to ok1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handlesOld=guidata(hObject);
handles.handlesOld=handlesOld;
guidata(hObject,handles);
eval(['f=@(x)',get(handles.f4,'String')]); 
N=str2num(get(handles.n4,'String'));
nl=length(N);
a=N';
Er=zeros(nl,1);
Er1=zeros(nl,1);
format long 
for i=1:nl
    [ er_singular_legendre,er_singular_nptp] = Singular_integral( f,N(i));
    Er(i)=er_singular_legendre;
    Er1(i)=er_singular_nptp;
end
c=[a,Er,Er1];
set(handles.table1,'UserData',c);
set(handles.table1,'Data',c);
handles=handles.handlesOld;
guidata(hObject,handles);

% --- Executes on button press in ok2.
function ok2_Callback(hObject, eventdata, handles)
% hObject    handle to ok2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close;
third;
