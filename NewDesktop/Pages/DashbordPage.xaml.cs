using NewDesktop.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace NewDesktop.Pages
{
    /// <summary>
    /// Логика взаимодействия для DashbordPage.xaml
    /// </summary>
    public partial class DashbordPage : Page
    {
        private HttpClient client = new HttpClient();
        private int selProjectId;

        public DashbordPage(int ProjectId)
        {
            InitializeComponent();

            selProjectId = ProjectId;

            GetInfo();

            Timer timer = new Timer();

            timer.Interval = 30000;
            timer.Elapsed += async ( sender, e ) => GetInfo();
            timer.AutoReset = true;
            timer.Enabled = true;
        }

        private async Task GetInfo()
        {
            var responce = await client.GetAsync("http://localhost:54640/api/Task?projectId=" + selProjectId);
            var json = await responce.Content.ReadAsStringAsync();
            var tasks = JsonSerializer.Deserialize<List<TaskClass>>(json);

            FirstBlock.Text = tasks.Where(x => x.FinishActualTime == null).Count().ToString();

            SecondBlock.Text = tasks.Where(x => x.FinishActualTime == null && x.Deadline < DateTime.Now).Count().ToString();

            if(Convert.ToInt32(SecondBlock.Text) > 2)
            {
                SecondGrid.Background = Brushes.Red;
            }

            ThirdBlock.Text = tasks.Where(x => x.FinishActualTime == null && x.StartActualTime < DateTime.Now).Count().ToString();

            if(ThirdBlock.Text == "0" && DateTime.Now.Hour >= 9 && DateTime.Now.Hour <= 18 && (int)DateTime.Now.DayOfWeek > 0 && (int)DateTime.Now.DayOfWeek < 6)
            {
                ThirdGrid.Background = Brushes.Red;
            }

            FourthBlock.Text = tasks.Where(x => x.FinishActualTime == null && x.StartActualTime > DateTime.Now.AddDays((double)DateTime.Now.DayOfWeek)).Count().ToString();

            HashSet<string> employees = tasks.ConvertAll(x => x.ExecuriveEmployeeFullName).ToHashSet();

            var finishList = employees.OrderBy(x => tasks.Where(y => y.ExecuriveEmployeeFullName == x && y.FinishActualTime != null && ((DateTime)y.FinishActualTime).Month == DateTime.Now.Month)).ToList();

            for (int i = 0; i < 5; i++)
            {
                if(finishList.Count > i)
                {
                    FifthBlock.Text += (i + 1) + ". " + finishList[i];
                }
            }

            employees = tasks.ConvertAll(x => x.ExecuriveEmployeeFullName).ToHashSet();

            finishList = employees.OrderBy(x => tasks.Where(y => y.ExecuriveEmployeeFullName == x && y.Deadline != null && ((DateTime)y.Deadline).Month == DateTime.Now.Month && (y.FinishActualTime > y.Deadline || y.FinishActualTime == null && y.Deadline < DateTime.Now)).Count()).ToList();

            for (int i = 0; i < 5; i++)
            {
                if (finishList.Count > i)
                {
                    SixethBlock.Text += (i + 1) + ". " + finishList[i];
                }
            }
        }
    }
}
