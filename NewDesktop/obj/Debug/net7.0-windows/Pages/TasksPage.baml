   M S B A M L   `   `   `  ����E  ANewDesktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:NewDesktop.PagesNewDesktop.Pages  5           NewDesktop.Pages.TasksPage   5      W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:NewDesktop.Pages     5        N� Title$  	TasksPage��5	      .��5
      �� .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ 
SearchText��5      $	��200��6*   $��10q�66   �� 5      -   5        $��
Поиск��5      $��50��69   $��10q�6D   5      �� 5   
   $ 
Horizontal=�6   .+�5      �� .+�5      �� -   5         ��Name$ 
TaskScroll��5      $
��Left=�63   $��10q�6N   $	��300��6Z   $	��600��6g   .��5      �� -   5         ��Name$ TaskView��5      ��5      �� 5      .R�5   "   � ��6,   �� *ActualWidth+ �� ElementName$ 
TaskScroll��5      ��5      �� 5      .R�5   "   �� $��1q�6)   
���   �._�5   &   �� .+�5   *   �� ��60   �� *Number+�� 5   *   ��60   �� *	FullTitle+�� 5    *   ��60   �� *ExecuriveEmployeeFullName+�� 5!   *   ��60   �� *DeadlineText+5"   '   5#   #   5$      5&      5'      �� 5)      $ 
Horizontal=�6   .+�5*      �� -   5        $��Добавить��5*      $	��100��60   $��10q�6<   6H   �� 5+      -   5        $��Удалить��5+      $	��100��6/   $��10q�6;   6G   5,      5-      �� 5/      -   5         ��Name$ TaskInfoPanel��5/      $	��300��60   $	��300��6=   $��Right=�6I   $y�Hidden=�6e   .+�50      �� $	��250��6   $	��280��6,   .��51      �� .+�52      �� $��
Номер��6    �� 53      -   5        $ TaskFullTitle��53   "   $	��250��6Q   ��69   �� *Number+6Q   �� 54      $��Наименование��6    �� 55      -	   5        $ TaskDescription��55   "   $	��250��6V   ��6;   �� *	FullTitle+6V   �� 56      $��Исполнитель��6    �� 57      -
   5         ��Name$ TaskEmployee��57   #    �� DisplayMemberPath$ FullName��69   $	��250��6V   �� 58      $��Дедлайн��6    (  "System.Windows.Controls.DatePicker  59      -   5        	  Name$	 TaskDeadline��59   %   $	��250��6]   
   SelectedDate
 6;   �� *
Deadline+6]   �� 5:      $��
Файлы��6    �� 5;      $��Наблюдатели��6    �� 5<      $��Статус��6    �� 5=      -   5        $ 	StatusBox��5=   #   $
 Name��66   $	��250��6O   5>      5?      �� 5A      -   5        $��Сохранить��5A      $��10q�6-   $	��100��69   6E   5B      5C      5D      5F      