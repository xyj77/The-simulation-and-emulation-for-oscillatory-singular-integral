function varargout = singular_chebyshev(varargin)
% SINGULAR_CHEBYSHEV MATLAB code for singular_chebyshev.fig
%      SINGULAR_CHEBYSHEV, by itself, creates a new SINGULAR_CHEBYSHEV or raises the existing
%      singleton*.
%
%      H = SINGULAR_CHEBYSHEV returns the handle to a new SINGULAR_CHEBYSHEV or the handle to
%      the existing singleton*.
%
%      SINGULAR_CHEBYSHEV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINGULAR_CHEBYSHEV.M with the given input arguments.
%
%      SINGULAR_CHEBYSHEV('Property','Value',...) creates a new SINGULAR_CHEBYSHEV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before singular_chebyshev_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to singular_chebyshev_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help singular_chebyshev

% Last Modified by GUIDE v2.5 21-Mar-2016 14:16:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @singular_chebyshev_OpeningFcn, ...
                   'gui_OutputFcn',  @singular_chebyshev_OutputFcn, ...
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


% --- Executes just before singular_chebyshev is made visible.
function singular_chebyshev_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to singular_chebyshev (see VARARGIN)

% Choose default command line output for singular_chebyshev
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes singular_chebyshev wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = singular_chebyshev_OutputFcn(hObject, eventdata, handles) 
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
eval(['f=@(x)',get(handles.f6,'String')]); 
N=str2num(get(handles.n6,'String'));
nl=length(N);
a=N';
er=zeros(nl,1);
er1=zeros(nl,1);
er2=zeros(nl,1);    
p1=zeros(nl,1);
p2=zeros(nl,1);  
for i=1:nl
p_best=p(f,N(i));
p2(i)=p_best;
p1(i)=2*atan((1e-15)^(1/N(i)));  
end
for i=1:nl
    [er_chebyshev_singular,er_nptp_singular]= singular3(f,N(i));
    er_nptp1_singular = singular3_nptp1( f,N(i),p2(i) );
    er(i)=er_chebyshev_singular;
    er1(i)=er_nptp_singular;
    er2(i)=er_nptp1_singular;
end
c=[a,er,er1,p1,er2,p2];
set(handles.table1,'UserData',c);
set(handles.table1,'Data',c);


function n6_Callback(hObject, eventdata, handles)
% hObject    handle to n6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n6 as text
%        str2double(get(hObject,'String')) returns contents of n6 as a double


% --- Executes during object creation, after setting all properties.
function n6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f6_Callback(hObject, eventdata, handles)
% hObject    handle to f6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f6 as text
%        str2double(get(hObject,'String')) returns contents of f6 as a double


% --- Executes during object creation, after setting all properties.
function f6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ok2.
function ok2_Callback(hObject, eventdata, handles)
% hObject    handle to ok2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close;
third;