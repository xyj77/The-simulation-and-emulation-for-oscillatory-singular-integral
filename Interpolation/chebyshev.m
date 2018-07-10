function varargout = chebyshev(varargin)
% CHEBYSHEV MATLAB code for chebyshev.fig
%      CHEBYSHEV, by itself, creates a new CHEBYSHEV or raises the existing
%      singleton*.
%
%      H = CHEBYSHEV returns the handle to a new CHEBYSHEV or the handle to
%      the existing singleton*.
%
%      CHEBYSHEV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHEBYSHEV.M with the given input arguments.
%
%      CHEBYSHEV('Property','Value',...) creates a new CHEBYSHEV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chebyshev_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chebyshev_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chebyshev

% Last Modified by GUIDE v2.5 16-Mar-2016 10:59:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chebyshev_OpeningFcn, ...
                   'gui_OutputFcn',  @chebyshev_OutputFcn, ...
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

function chebyshev_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chebyshev (see VARARGIN)

% Choose default command line output for chebyshev
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% handlesOld=guidata(hObject);
% handles.handlesOld=handlesOld;
% guidata(hObject,handles);

function varargout = chebyshev_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

%  1/(2+cos(40*x))
function ok_Callback(hObject, eventdata, handles)
eval(['f=@(x)',get(handles.f1,'String')]); 
N=str2num(get(handles.n1,'String'));
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
    [er_chebyshev,er_nptp1]=nptp(f,N(i));
    er_nptp2=nptp2(f,N(i),p2(i));
    er(i)=er_chebyshev;
    er1(i)=er_nptp1;
    er2(i)=er_nptp2;
end
c=[a,er,er1,p1,er2,p2];
set(handles.table1,'UserData',c);
set(handles.table1,'Data',c);
temp=2:2:20;
tl=length(temp);
for i=1:tl
    [er_chebyshev,er_nptp1]=nptp(f,temp(i));
    p_best=p(f,temp(i));
    pp=p_best;
    er_nptp2=nptp2(f,temp(i),pp);
    Er(i)=er_chebyshev;
    Er1(i)=er_nptp1;
    Er2(i)=er_nptp2;
end
temp=2:2:20;
for i=1:tl
log_er(i)=log2(Er(i));
log_er1(i)=log2(Er1(i));
log_er2(i)=log2(Er2(i));
end
plot(temp,log_er,'bo-');
grid on
hold on
plot(temp,log_er1,'k-');
hold on
plot(temp,log_er2,'r*-');
hold off
xlabel(handles.axes1,'n');
ylabel(handles.axes1,'log2(Er)');
legend('er(chebyshev)','er(nptp1)','er(nptp2)');
% handles=handles.handlesOld;
% guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function n1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');

end
% --- Executes during object creation, after setting all properties.
function f1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function f1_Callback(hObject, eventdata, handles)
% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of f1 as text
%        str2double(get(hObject,'String')) returns contents of f1 as a double
handlesOld=guidata(hObject);
handles.handlesOld=handlesOld;
guidata(hObject,handles);
handles=handles.handlesOld;
guidata(hObject,handles);
function n1_Callback(hObject, eventdata, handles)
% hObject    handle to n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of n1 as text
%        str2double(get(hObject,'String')) returns contents of n1 as a double
% --- Executes on button press in ok1.
handlesOld=guidata(hObject);
handles.handlesOld=handlesOld;
guidata(hObject,handles);
handles=handles.handlesOld;
guidata(hObject,handles);
function ok1_Callback(hObject, eventdata, handles)
% hObject    handle to ok1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close;
second;
% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
