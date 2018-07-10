function varargout = guass_chebyshev(varargin)
% GUASS_CHEBYSHEV MATLAB code for guass_chebyshev.fig
%      GUASS_CHEBYSHEV, by itself, creates a new GUASS_CHEBYSHEV or raises the existing
%      singleton*.
%
%      H = GUASS_CHEBYSHEV returns the handle to a new GUASS_CHEBYSHEV or the handle to
%      the existing singleton*.
%
%      GUASS_CHEBYSHEV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUASS_CHEBYSHEV.M with the given input arguments.
%
%      GUASS_CHEBYSHEV('Property','Value',...) creates a new GUASS_CHEBYSHEV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guass_chebyshev_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guass_chebyshev_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guass_chebyshev

% Last Modified by GUIDE v2.5 17-Mar-2016 17:22:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guass_chebyshev_OpeningFcn, ...
                   'gui_OutputFcn',  @guass_chebyshev_OutputFcn, ...
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


% --- Executes just before guass_chebyshev is made visible.
function guass_chebyshev_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guass_chebyshev (see VARARGIN)

% Choose default command line output for guass_chebyshev
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guass_chebyshev wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guass_chebyshev_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function f2_Callback(hObject, eventdata, handles)
% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f2 as text
%        str2double(get(hObject,'String')) returns contents of f2 as a double
handlesOld=guidata(hObject);
handles.handlesOld=handlesOld;
guidata(hObject,handles);
handles=handles.handlesOld;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function f2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n2_Callback(hObject, eventdata, handles)
% hObject    handle to n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n2 as text
%        str2double(get(hObject,'String')) returns contents of n2 as a double
handlesOld=guidata(hObject);
handles.handlesOld=handlesOld;
guidata(hObject,handles);
handles=handles.handlesOld;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function n2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n2 (see GCBO)
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
eval(['f=@(x)',get(handles.f2,'String')]); 
N=str2num(get(handles.n2,'String'));
nl=length(N);
a=N';
Er=zeros(nl,1);
Er1=zeros(nl,1);
format long 
for i=1:nl
    [Er_chebyshev,Er_nptp1]=guasschebyshev(f,N(i));
    Er(i)=Er_chebyshev;
    Er1(i)=Er_nptp1;
end
c=[a,Er,Er1];
set(handles.table1,'UserData',c);
set(handles.table1,'Data',c);
temp=10:2:40;
tl=length(temp);
for i=1:tl
[Er_chebyshev,Er_nptp1]=guasschebyshev(f,temp(i));
    E(i)=Er_chebyshev;
    E1(i)=Er_nptp1;
end
temp=10:2:40;
for i=1:tl
log_e(i)=log2(E(i));
log_e1(i)=log2(E1(i));
end
plot(temp,log_e,'b*-');
grid on
hold on
plot(temp,log_e1,'k-');
hold off
xlabel(handles.axes1,'n');
ylabel(handles.axes1,'log2(Er)');
legend('er(chebyshev)','er(nptp1)');
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
