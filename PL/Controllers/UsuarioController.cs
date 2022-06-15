using Microsoft.AspNetCore.Mvc;

namespace PL.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult GetAll()
        {
            //llamo al get all de aseguradora
            ML.Result result = BL.Usuario.UsuarioGetAllEF();

            //creo una instancia de aseguradora
            ML.Usuario usuario = new ML.Usuario();

            //paso de mi lista result.objects a mi lista de aseguradoras
            usuario.Usuarios = result.Objects;

            return View(usuario);
        }
        [HttpGet]
        public ActionResult Form(int? IdUsuario)
        {
            ML.Usuario usuario = new ML.Usuario();
            ML.Result resultRol = BL.Rol.RolAllEF();

            usuario.Rol = new ML.Rol();
            usuario.Rol.Roles = resultRol.Objects.ToList();

            if (IdUsuario == null)//ADD
            {

                return View(usuario);
            }
            else  //UPDATE
            {
                ML.Result result = BL.Usuario.GetByIdEF(IdUsuario.Value);

                if (result.Correct)
                {
                    usuario = new ML.Usuario();
                    usuario = ((ML.Usuario)result.Object);
                    ViewBag.Message = " No se pudo realizar la consulta " + result.ErrorMessage;
                    return View(usuario);
                }
            }
            return View(usuario);

        }



        [HttpPost]
        public ActionResult Form(ML.Usuario usuario)
        {
            ML.Result result = BL.Usuario.AddEF(usuario);
            if (result.Correct)

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
