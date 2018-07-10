function varargout = Main2(varargin)
% MAIN2 MATLAB code for Main2.fig
%      Main2, by itself, creates a new Main2 or raises the existing
%      singleton*.
%
%      H = Main2 returns the handle to a new Main2 or the handle to
%      the existing singleton*.
%
%      Main2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Main2.M with the given input arguments.
%
%      Main2('Property','Value',...) creates a new Main2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main2

% Last Modified by GUIDE v2.5 10-May-2016 12:33:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main2_OpeningFcn, ...
                   'gui_OutputFcn',  @Main2_OutputFcn, ...
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


% --- Executes just before Main2 is made visible.
function Main2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main2
handles.output = hObject;
set(handles.Rad_Real,'value',0);
set(handles.Rad_Img,'value',1);

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Main2 wait for user response (see UIRESUME)
% uiwait(handles.Main2);


% --- Outputs from this function are returned to the command line.
function varargout = Main2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Example_Callback(hObject, eventdata, handles)
% hObject    handle to Example (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hFont = uisetfont();
% mycolor = uisetcolor();
h=dialog('name','帮助...','position',[700 400 250 120]);  
uicontrol('parent',h,'style','text','string','二次振荡奇异积分数值计算','position',[0 70 250 30],'fontsize',14); 
uicontrol('parent',h,'style','pushbutton','position',[100 10 60 35],'string','确定','callback','delete(gcbf)','fontsize',10);  

% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=dialog('name','关于...','position',[700 400 250 140]);  
uicontrol('parent',h,'style','text','string','WIT','position',[50 100 120 20],'fontsize',14); 
uicontrol('parent',h,'style','text','string','计算机科学与工程学院','position',[44 60 180 20],'fontsize',12); 
uicontrol('parent',h,'style','pushbutton','position',[100 10 60 35],'string','确定','callback','delete(gcbf)','fontsize',10);  


% --------------------------------------------------------------------
function example1_Callback(hObject, eventdata, handles)
% hObject    handle to example1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% v=get(handles.Rad_Real,'Value');
% set(handles.f,'String','exp(x)');
% if ~isequal(v,0)
%     %eval(['f=@(x)','cos(w.*x).*',get(handles.f,'String'),'./(x-t)',';']);
%     f=@(x)cos(w.*x).*exp(x)./(x-t);
% else
%     %eval(['f=@(x)','sin(w.*x).*',get(handles.edit1,'String'),'./(x-t)',';']);
%     f=@(x)sin(w.*x).*exp(x)./(x-t);
% end
% ezplot(f,[-1,6]);

%设置初始值
set(handles.w,'String','8,16,32,64');
w=[8,16,32,64];
set(handles.t,'String','0');
t=0;
set(handles.n,'String','3,4,5');
n=[3,4,5];
set(handles.f,'String','exp(x)');

v=get(handles.Rad_Real,'Value');
if ~isequal(v,0)                        %判断实部虚部
    tag=1;
else
    tag=0;
end

%开始计算   
lw=length(w);
ln=length(n);
global Er;
Er=zeros(lw,ln);                   %误差表

%进度条
h=waitbar(0,'开始计算','Position',[500 300 275 60],'Name','计算进度...');
% pause(1);
hac=get(get(h,'children'),'children');
hapa=findall(hac,'type','patch');
set(hapa,'EdgeColor','b','FaceColor','g');
task=0;
for a=1:lw
    v=get(handles.Rad_Real,'Value');
    if ~isequal(v,0)                        %判断实部虚部
        f=@(x)cos(w(a).*x.*x).*exp(x)./(x-t);
    else
        f=@(x)sin(w(a).*x.*x).*exp(x)./(x-t);
    end
%     eval(['fun=@(x)',get(handles.f,'String'),';']);
    for b=1:ln
        task=task+100/12;
        waitbar(task/100,h,['已完成' num2str(task) '%']);
        Er(a,b)=I_ErExp2(f,w(a),n(b),t,tag);%计算误差 
    end    
end
close(h);

%绘图
axes(handles.axes1);
legend off;
w=64;
if ~isequal(v,0)                        %判断实部虚部
        f1=@(x)cos(w.*x.^2).*exp(x)./(x-t);
    else
        f1=@(x)sin(w.*x.^2).*exp(x)./(x-t);
end
ezplot(f1,[-1,1]),legend('w=64'),grid on;
w=[8,16,32,64];

%计算Rate
Er(4,2)=Er(4,2);
Er(4,3)=Er(4,3);
Rate=log(Er(3,:)./Er(4,:))./log(2);
e=[Er;Rate];

c={ e(1,1),e(2,1),e(3,1),e(4,1),e(5,1);...
    e(1,2),e(2,2),e(3,2),e(4,2),e(5,2);...
    e(1,3),e(2,3),e(3,3),e(4,3),e(5,3)};
 %设置表格
set(handles.Table,'RowName',{ num2str(w(1)), num2str(w(2)), num2str(w(3)),num2str(w(4)),'Rate'});
set(handles.Table,'ColumnName',{ num2str(n(1)), num2str(n(2)), num2str(n(3))});
set(handles.Table,'Data',c');              
set(handles.Table,'UserData',c');

guidata(hObject, handles);

% --------------------------------------------------------------------
function example2_Callback(hObject, eventdata, handles)
% hObject    handle to example2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%设置初始值
set(handles.w,'String','16,32,64,128');
w=[16,32,64,128];
set(handles.t,'String','-0.13');
t=-0.13;
set(handles.n,'String','3,4,5');
n=[3,4,5];
set(handles.f,'String','sinh(x)');

v=get(handles.Rad_Real,'Value');
if ~isequal(v,0)                        %判断实部虚部
    tag=1;
else
    tag=0;
end

%开始计算
lw=length(w);
ln=length(n);                 
global Er; %误差表
Er=zeros(lw,ln);

%进度条
h=waitbar(0,'开始计算','Position',[500 300 275 60],'Name','计算进度...');
% pause(1);
hac=get(get(h,'children'),'children');
hapa=findall(hac,'type','patch');
set(hapa,'EdgeColor','g','FaceColor','b');
task=0;
for a=1:lw
    v=get(handles.Rad_Real,'Value');
    if ~isequal(v,0)                        %判断实部虚部
        f=@(x)cos(w(a).*x.*x).*sinh(x)./(x-t);
    else
        f=@(x)sin(w(a).*x.*x).*sinh(x)./(x-t);
    end
%     eval(['fun=@(x)',get(handles.f,'String'),';']);
    for b=1:ln
        task=task+100/12;
        waitbar(task/100,h,['已完成' num2str(task) '%']);
        Er(a,b)=I_ErSinh(f,w(a),n(b),t,tag);%计算误差    
    end    
end
close(h);

%绘图
axes(handles.axes1);
legend off;
w=64;
if ~isequal(v,0)                        %判断实部虚部
        f1=@(x)cos(w.*x.^2).*sinh(x)./(x-t);
    else
        f1=@(x)sin(w.*x.^2).*sinh(x)./(x-t);
end
ezplot(f1,[-1,1]),legend('w=128'),grid on;
w=[16,32,64,128];

%计算Rate
Rate=log(Er(3,:)./Er(4,:))./log(2);
e=[Er;Rate];
c={ e(1,1),e(2,1),e(3,1),e(4,1),e(5,1);...
    e(1,2),e(2,2),e(3,2),e(4,2),e(5,2);...
    e(1,3),e(2,3),e(3,3),e(4,3),e(5,3)};

%设置表格
set(handles.Table,'RowName',{ num2str(w(1)), num2str(w(2)), num2str(w(3)),num2str(w(4)),'Rate'});
set(handles.Table,'ColumnName',{ num2str(n(1)), num2str(n(2)), num2str(n(3))});
set(handles.Table,'Data',c');             
set(handles.Table,'UserData',c');


guidata(hObject, handles);

% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function New_Callback(hObject, eventdata, handles)
% hObject    handle to New (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

selection = questdlg(['确定要返回主界面吗？'],...
                     ['提示'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
elseif strcmp(selection,'Yes')
    clc;
    close;
end



function f_Callback(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f as text
%        str2double(get(hObject,'String')) returns contents of f as a double


% --- Executes during object creation, after setting all properties.
function f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w_Callback(hObject, eventdata, handles)
% hObject    handle to w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w as text
%        str2double(get(hObject,'String')) returns contents of w as a double


% --- Executes during object creation, after setting all properties.
function w_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(hObject,'String','OK');

if isempty(get(handles.w,'String'))         %获取震荡速率w
    msgbox('    请输入 w 的值！','提示','help');
    return;
else
    w=str2num(get(handles.w,'String'));
end
if isempty(get(handles.t,'String'))         %判断t是否为空
    msgbox('    请输入 t 的值！','提示','help');
    return;
else
    t=str2num(get(handles.t,'String'));
end
if isempty(get(handles.n,'String'))         %获取n值
    msgbox('    请输入 n 的值！','提示','help');
    return;
else
    n=str2num(get(handles.n,'String'));
%     if isnan(n)         %判断是否是实数
%        errodlg('必须输入整数！','Error','modal');
%        return;          %跳出一个对话框
%     end
end

lw=length(w);
ln=length(n);
Er=zeros(lw,ln);                   %误差表

%进度条
h=waitbar(0,'开始计算','Position',[500 300 275 60],'Name','计算进度...');
% pause(1);
hac=get(get(h,'children'),'children');
hapa=findall(hac,'type','patch');
set(hapa,'EdgeColor','b','FaceColor','g');
task=0;
for a=1:lw
    if isempty(get(handles.f,'String'))         %获取n值
        msgbox('请输入非振荡非奇异部分的函数f(x)！','提示','help');
        return;
    end    
    v=get(handles.Rad_Real,'Value');
    if ~isequal(v,0)                        %判断实部虚部
        eval(['fun=@(x)','cos(w(a).*x.^2).*',get(handles.f,'String'),'./(x-t)',';']);
        tag=1;
    else
        eval(['fun=@(x)','sin(w(a).*x.^2).*',get(handles.f,'String'),'./(x-t)',';']);        
        tag=0;
    end
    eval(['f=@(x)',get(handles.f,'String'),';']);
    for b=1:ln
        task=task+100/12;
        waitbar(task/100,h,['已完成' num2str(task) '%']);
        Er(a,b)=I_Er(fun,f,w(a),n(b),t,tag,2);%计算误差     
    end    
end
close(h);
%绘图
axes(handles.axes1);
legend off;
w=128;
if ~isequal(v,0)                        %判断实部虚部
        f=@(x)cos(w.*x.^2).*f(x)./(x-t);
    else
        f=@(x)sin(w.*x.^2).*f(x)./(x-t);
end
ezplot(f,[-1,1]),legend('w=128'),grid on;
w=str2num(get(handles.w,'String'));

%计算Rate
% Rate=log(Er(3,:)./Er(4,:))./log(2);
% e=[Er;Rate];
% c={ e(1,1),e(2,1),e(3,1),e(4,1),e(5,1);...
%     e(1,2),e(2,2),e(3,2),e(4,2),e(5,2);...
%     e(1,3),e(2,3),e(3,3),e(4,3),e(5,3)};

%设置表格
set(handles.Table,'RowName',{ num2str(w(1)), num2str(w(2)), num2str(w(3)),num2str(w(4))});
set(handles.Table,'ColumnName',{ num2str(n(1)), num2str(n(2)), num2str(n(3))});
set(handles.Table,'Data',Er);             
set(handles.Table,'UserData',Er);


%%最速下降分析
% axes(handles.axes1);
% hold off;
% global Er;
% % set(0,'DefaultAxesColorOrder',[1 0 0;0 1 0;0 0 1]);
% % set(0,'DefaultAxesLineStyleOrder','-*|-^|-o');
% % for a=1:ln
% %     str=strcat('n=',num2str(n(a)));
% %     plot(w,log(Er(:,a)')),legend(str),hold all;
% % end
% % hold off;
% % set(0,'DefaultAxesLineStyleOrder','remove');
% % set(0,'DefaultAxesColorOrder','remove');
% plot(w,log(Er(:,1)'),'-*r'),hold on;
% plot(w,log(Er(:,2)'),'-^g'),hold on;
% plot(w,log(Er(:,3)'),'-ob'),hold on;
% legend('n=3','n=4','n=5');

guidata(hObject, handles);

% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.f,'String','');
set(handles.t,'String','');
set(handles.w,'String','');
set(handles.n,'String','');
%清空表格
set(handles.Table,'Data',[]);
legend off;
cla;

guidata(hObject, handles);

% --- Executes on button press in Rad_Real.
function Rad_Real_Callback(hObject, eventdata, handles)
% hObject    handle to Rad_Real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Rad_Real,'value',1);
set(handles.Rad_Img,'value',0);
% Hint: get(hObject,'Value') returns toggle state of Rad_Real

guidata(hObject, handles);

% --- Executes on button press in Rad_Img.
function Rad_Img_Callback(hObject, eventdata, handles)
% hObject    handle to Rad_Img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Rad_Real,'value',0);
set(handles.Rad_Img,'value',1);
% Hint: get(hObject,'Value') returns toggle state of Rad_Img

guidata(hObject, handles);

function t_Callback(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Def_Callback(hObject, eventdata, handles)
% hObject    handle to Def (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.f,'String','');
set(handles.t,'String','0');
set(handles.w,'String','8,16,32,64');
set(handles.n,'String','3,4,5');

guidata(hObject, handles);

% --------------------------------------------------------------------
function Link_Callback(hObject, eventdata, handles)
% hObject    handle to Link (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
first;


% --------------------------------------------------------------------
function Draw_Callback(hObject, eventdata, handles)
% hObject    handle to Draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Fresh_Callback(hObject, eventdata, handles)
% hObject    handle to Fresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function chap1_Callback(hObject, eventdata, handles)
% hObject    handle to chap1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%第一章示例图

% --------------------------------------------------------------------
function cmpEr_Callback(hObject, eventdata, handles)
% hObject    handle to cmpEr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%第四章示例图
w=[16,32,64,128];
time=zeros(3,4);
Erquad=zeros(3,4);
x=-1:0.01:1;
for a=1:4
%     f1=@(x)cos(w(a).*x).*exp(x)./(x-t);
    str=strcat('w=',num2str(w(a)));
%     f2=@(x)sin(w(a).*x).*sinh(x)./(x-t);
    f3=@(x)sin(w(a).*x).*exp(x);
%     subplot(2,2,a),plot(x,f3(x)),text(0.6,3.5,str),xlabel('x'),ylabel('被积函数值');
    
    %精确值
    I=integral(f3,-1,1,'AbsTol',1e-18,'RelTol',1e-18);
    
%     tic;
%     I_trapz=trapz(f3(x));
%     time(1,a)=toc;
%     Er(1,a)=abs(I_trapz-I);
    
    tic;
    I_quad=quad(f3,-1,1);
    time(1,a)=toc;
    Erquad(1,a)=abs(I_quad-I);
    
    tic;
    I_quadl=quadl(f3,-1,1);
    time(2,a)=toc;
    Erquad(2,a)=abs(I_quadl-I);
    
    tic;
    I_quadgk=quadgk(f3,-1,1);
    time(3,a)=toc;
    Erquad(3,a)=abs(I_quadgk-I); 
end

set(handles.Table,'Data',Erquad');               %设置表格
set(handles.Table,'RowName',{ num2str(w(1)), num2str(w(2)), num2str(w(3)),num2str(w(4))});
set(handles.Table,'ColumnName',{ 'quad', 'quadl','quadgk'});

axes(handles.axes1);
% figure;
hold off;
plot(w,log(Erquad(1,:)),'-*r'),hold on;
plot(w,log(Erquad(2,:)),'-^g'),hold on;
plot(w,log(Erquad(3,:)),'-ob');
legend('quad','quadl','quadgk','location','northeast');

guidata(hObject, handles);

% --------------------------------------------------------------------
function cmpTime_Callback(hObject, eventdata, handles)
% hObject    handle to cmpTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%第四章示例图
w=[16,32,64,128];
time=zeros(3,4);
Erquad=zeros(3,4);

for a=1:4
    f3=@(x)sin(w(a).*x).*exp(x);
%     subplot(2,2,a),plot(x,f3(x)),text(0.6,3.5,str),xlabel('x'),ylabel('被积函数值');

%精确值
    I=integral(f3,-1,1,'AbsTol',1e-18,'RelTol',1e-18);
    
%     tic;
%     I_trapz=trapz(f3(x));
%     time(1,a)=toc;
%     Er(1,a)=abs(I_trapz-I);
    
    tic;
    I_quad=quad(f3,-1,1);
    time(1,a)=toc;
    Erquad(1,a)=abs(I_quad-I);
    
    tic;
    I_quadl=quadl(f3,-1,1);
    time(2,a)=toc;
    Erquad(2,a)=abs(I_quadl-I);
    
    tic;
    I_quadgk=quadgk(f3,-1,1);
    time(3,a)=toc;
    Erquad(3,a)=abs(I_quadgk-I); 
end

set(handles.Table,'Data',time');               %设置表格
set(handles.Table,'RowName',{ num2str(w(1)), num2str(w(2)), num2str(w(3)),num2str(w(4))});
set(handles.Table,'ColumnName',{ 'quad', 'quadl','quadgk'});

axes(handles.axes1);
% figure;
hold off;
plot(w,time(1,:),'-*r'),hold on;
plot(w,time(2,:),'-^g'),hold on;
plot(w,time(3,:),'-ob');
legend('quad','quadl','quadgk','location','northwest');

guidata(hObject, handles);

% --------------------------------------------------------------------
function Gredit_Callback(hObject, eventdata, handles)
% hObject    handle to Gredit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(get(handles.w,'String'))         %获取震荡速率w
    msgbox('    请输入 w 的值！','提示','help');
    return;
else
    w=str2num(get(handles.w,'String'));
end
if isempty(get(handles.t,'String'))         %判断t是否为空
    msgbox('    请输入 t 的值！','提示','help');
    return;
else
    t=str2num(get(handles.t,'String'));
end
if isempty(get(handles.n,'String'))         %获取n值
    msgbox('    请输入 n 的值！','提示','help');
    return;
else
    n=str2num(get(handles.n,'String'));
%     if isnan(n)         %判断是否是实数
%        errodlg('必须输入整数！','Error','modal');
%        return;          %跳出一个对话框
%     end
end

lw=length(w);
ln=length(n);

axes(handles.axes1);
hold off;
global Er;
% set(0,'DefaultAxesColorOrder',[1 0 0;0 1 0;0 0 1]);
% set(0,'DefaultAxesLineStyleOrder','-*|-^|-o');
% for a=1:ln
%     str=strcat('n=',num2str(n(a)));
%     plot(w,log(Er(:,a)')),legend(str),hold all;
% end
% hold off;
% set(0,'DefaultAxesLineStyleOrder','remove');
% set(0,'DefaultAxesColorOrder','remove');
plot(w,log(Er(:,1)'),'-*r'),hold on;
plot(w,log(Er(:,2)'),'-^g'),hold on;
plot(w,log(Er(:,3)'),'-ob'),hold on;
legend('n=3','n=4','n=5');
%计算Rate
Rate=log(Er(3,:)./Er(4,:))./log(2);
e=[Er;Rate];

c={ e(1,1),e(2,1),e(3,1),e(4,1),e(5,1);...
    e(1,2),e(2,2),e(3,2),e(4,2),e(5,2);...
    e(1,3),e(2,3),e(3,3),e(4,3),e(5,3)};
  %设置表格
set(handles.Table,'RowName',{ num2str(w(1)), num2str(w(2)), num2str(w(3)),num2str(w(4)),'Rate'});
set(handles.Table,'ColumnName',{ num2str(n(1)), num2str(n(2)), num2str(n(3))});
set(handles.Table,'Data',c');             
set(handles.Table,'UserData',c');

guidata(hObject, handles);


% --------------------------------------------------------------------
function chap1ex1_Callback(hObject, eventdata, handles)
% hObject    handle to chap1ex1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%第一章示例图
w=[16,32,64,128];
t=-0.13;
x=-1:0.005:1;
figure;
for a=1:4
%     f1=@(x)cos(w(a).*x).*exp(x)./(x-t);
    str=strcat('w=',num2str(w(a)));
    f2=@(x)sin(w(a).*x).*sinh(x)./(x-t);
%     subplot(2,2,a),plot3(x,f1(x),f2(x));
    subplot(2,2,a),plot(x,f2(x)),text(0.6,4,str),xlabel('x'),ylabel('一次被积函数值'),axis([-1 1 -5 5]);
end

guidata(hObject, handles);

% --------------------------------------------------------------------
function chap1ex2_Callback(hObject, eventdata, handles)
% hObject    handle to chap1ex2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%第一章示例图
w=[16,32,64,128];
t=-0.13;
x=-1:0.005:1;
figure;
for a=1:4
%     f1=@(x)cos(w(a).*x).*exp(x)./(x-t);
    str=strcat('w=',num2str(w(a)));
    f2=@(x)sin(w(a).*x.*x).*sinh(x)./(x-t);
%     subplot(2,2,a),plot3(x,f1(x),f2(x));
    subplot(2,2,a),plot(x,f2(x)),text(0.6,4,str),xlabel('x'),ylabel('二次被积函数值'),axis([-1 1 -5 5]);
end
guidata(hObject, handles);

% --------------------------------------------------------------------
function TraEr_Callback(hObject, eventdata, handles)
% hObject    handle to TraEr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%第一章经典积分图

%进度条
h=waitbar(0,'开始计算','Position',[500 300 275 60],'Name','计算进度...');
% pause(1);
hac=get(get(h,'children'),'children');
hapa=findall(hac,'type','patch');
set(hapa,'EdgeColor','b','FaceColor','c');
task=0;

q_5=zeros(100,1);
q_10=zeros(100,1);
for w=1:100,
    f=@(x)exp(x+1i*w*x.*x);
    q_5(w)=gausslegendre(f,-1,1,5);
    q_10(w)=gausslegendre(f,-1,1,10);
    task=task+1;
    waitbar(task/100,h,['正在计算w=' num2str(w) ',已完成' num2str(task) '%']);
end;
close(h);
%精确值利用Mathematica计算，载入精确值
load('I_imag.mat');
load('I_real.mat');

Er_5=abs(q_5-I_imag.*1i-I_real);
Er_10=abs(q_10-I_imag.*1i-I_real);
figure;
w=1:100;
subplot(1,2,1),plot(w,Er_5(1:100,1),'b-'),xlabel('w'),ylabel('5点Gauss-legendre求积公式误差'),legend('n=5');
subplot(1,2,2),plot(w,Er_10(1:100,1),'r-'),xlabel('w'),ylabel('10点Gauss-legendre求积公式误差'),legend('n=10');


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Start.
function Start_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(get(handles.w,'String'))         %获取震荡速率w
    msgbox('    请输入 w 的值！','提示','help');
    return;
else
    w=str2num(get(handles.w,'String'));
end
if isempty(get(handles.t,'String'))         %判断t是否为空
    msgbox('    请输入 t 的值！','提示','help');
    return;
else
    t=str2num(get(handles.t,'String'));
end
if isempty(get(handles.n,'String'))         %获取n值
    msgbox('    请输入 n 的值！','提示','help');
    return;
else
    n=str2num(get(handles.n,'String'));
%     if isnan(n)         %判断是否是实数
%        errodlg('必须输入整数！','Error','modal');
%        return;          %跳出一个对话框
%     end
end

lw=length(w);
ln=length(n);
Er=zeros(lw,ln);                   %误差表

%进度条
h=waitbar(0,'开始计算','Position',[500 300 275 60],'Name','计算进度...');
% pause(1);
hac=get(get(h,'children'),'children');
hapa=findall(hac,'type','patch');
set(hapa,'EdgeColor','b','FaceColor','g');
task=0;
for a=1:lw
    if isempty(get(handles.f,'String'))         %获取n值
        msgbox('请输入非振荡非奇异部分的函数f(x)！','提示','help');
        return;
    end    
    v=get(handles.Rad_Real,'Value');
    if ~isequal(v,0)                        %判断实部虚部
        eval(['fun=@(x)','cos(w(a).*x.*x)',get(handles.f,'String'),'./(x-t)',';']);
        tag=1;
    else
        eval(['fun=@(x)','sin(w(a).*x.*x)',get(handles.f,'String'),'./(x-t)',';']);
        tag=0;
    end
    eval(['f=@(x)',get(handles.f,'String'),';']);
    for b=1:ln
        task=task+100/12;
        waitbar(task/100,h,['已完成' num2str(task) '%']);
        Er(a,b)=I_Er(fun,f,w(a),n(b),t,tag,2);%计算误差     
    end    
end
close(h);
%绘图
axes(handles.axes1);
legend off;
w=128;
if ~isequal(v,0)                        %判断实部虚部
        f=@(x)cos(w.*x.^2).*f(x)./(x-t);
    else
        f=@(x)sin(w.*x.^2).*f(x)./(x-t);
end
ezplot(f,[-1,1]),legend('w=128'),grid on;
w=str2num(get(handles.w,'String'));

%计算Rate
% Rate=log(Er(3,:)./Er(4,:))./log(2);
% e=[Er;Rate];
% c={ e(1,1),e(2,1),e(3,1),e(4,1),e(5,1);...
%     e(1,2),e(2,2),e(3,2),e(4,2),e(5,2);...
%     e(1,3),e(2,3),e(3,3),e(4,3),e(5,3)};

%设置表格
set(handles.Table,'RowName',{ num2str(w(1)), num2str(w(2)), num2str(w(3)),num2str(w(4))});
set(handles.Table,'ColumnName',{ num2str(n(1)), num2str(n(2)), num2str(n(3))});
set(handles.Table,'Data',Er);             
set(handles.Table,'UserData',Er);


%%最速下降分析
% axes(handles.axes1);
% hold off;
% global Er;
% % set(0,'DefaultAxesColorOrder',[1 0 0;0 1 0;0 0 1]);
% % set(0,'DefaultAxesLineStyleOrder','-*|-^|-o');
% % for a=1:ln
% %     str=strcat('n=',num2str(n(a)));
% %     plot(w,log(Er(:,a)')),legend(str),hold all;
% % end
% % hold off;
% % set(0,'DefaultAxesLineStyleOrder','remove');
% % set(0,'DefaultAxesColorOrder','remove');
% plot(w,log(Er(:,1)'),'-*r'),hold on;
% plot(w,log(Er(:,2)'),'-^g'),hold on;
% plot(w,log(Er(:,3)'),'-ob'),hold on;
% legend('n=3','n=4','n=5');

guidata(hObject, handles);
