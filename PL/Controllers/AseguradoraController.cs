using Microsoft.AspNetCore.Mvc;

namespace PL.Controllers
{
    public class AseguradoraController : Controller
    {
        // GET: Aseguradora
        public ActionResult GetAll()
        {
            //llamo al get all de aseguradora
            ML.Result result = BL.Aseguradora.GetAllEF();

            //creo una instancia de aseguradora
            ML.Aseguradora aseguradora = new ML.Aseguradora();

            //paso de mi lista result.objects a mi lista de aseguradoras
            aseguradora.Aseguradoras = result.Objects;

            return View(aseguradora);
        }

        [HttpGet]
        public ActionResult Form()
        {

            return View();            
        }
        [HttpPost]
        public ActionResult Form(ML.Aseguradora aseguradora)
        {
            ML.Result result = BL.Aseguradora.AddEF(aseguradora);
            if(result.Correct)

            {
                ViewBag.Message = "Se ha agreago correctamente";
                return PartialView("Modal");
            }
            else
            {
                ViewBag.Message = "No se ha agreago correctamente";
                return PartialView("Modal");

            }
        }

    }
}
