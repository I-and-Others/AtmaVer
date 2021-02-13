using System.Threading.Tasks;

namespace AtmaVer.Services.Services
{
    public interface IEmailSender
    {
        public Task SendMessage(string messageSubject, string messageBody, string toMailAddress);
    }
}
