using Microsoft.EntityFrameworkCore;

namespace BL
{
    public class Aseguradora
    {
        public static ML.Result AddEF(ML.Aseguradora aseguradora)
        {
            ML.Result result = new ML.Result();

            try
            {
                using (DL.LEscogidoProgramacionNCapasMayoContext context = new DL.LEscogidoProgramacionNCapasMayoContext())
                {
                    //var query = context.AseguradoraAdd(aseguradora.Nombre, aseguradora.Usuario.IdUsuario);
                    var query = context.Database.ExecuteSqlRaw($"AseguradoraAdd '{aseguradora.Nombre}',{aseguradora.Usuario.IdUsuario}");


                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se insertó el registro";
                    }

                    result.Correct = true;

                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }
            return result;
        }
        //UPDATE
        public static ML.Result UpdateEF(ML.Aseguradora aseguradora) //12/12/2019 No se elimina la credencial, se cambia
        {
            ML.Result result = new ML.Result();
            try
            {

                using (DL.LEscogidoProgramacionNCapasMayoContext context = new DL.LEscogidoProgramacionNCapasMayoContext())

                {
                    //var updateResult = context.AseguradoraUpdate(aseguradora.IdAseguradora, aseguradora.Nombre, aseguradora.Usuario.IdUsuario);
                    var query = context.Database.ExecuteSqlRaw($"AseguradoraUpdate {aseguradora.IdAseguradora},'{aseguradora.Nombre}',{aseguradora.Usuario.IdUsuario}");

                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se actualizó el status de la credencial";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }

            return result;
        }
        //DELETE
        public static ML.Result DeleteEF(ML.Aseguradora aseguradora) //12/12/2019 No se elimina la credencial, se cambia
        {
            ML.Result result = new ML.Result();
            try
            {

                using (DL.LEscogidoProgramacionNCapasMayoContext context = new DL.LEscogidoProgramacionNCapasMayoContext())

                {
                    // var updateResult = context.AseguradoraDelete(aseguradora.IdAseguradora);
                    var query = context.Database.ExecuteSqlRaw($"AseguradoraDelete {aseguradora.IdAseguradora}");

                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se actualizó el status de la credencial";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }

            return result;
        }

        //GETALL

        public static ML.Result GetAllEF()
        {
            ML.Result result = new ML.Result();

            try
            {

                using (DL.LEscogidoProgramacionNCapasMayoContext context = new DL.LEscogidoProgramacionNCapasMayoContext())
                {


                    //var aseguradoras = context.AseguradoraGetAll().ToList();
                    var aseguradoras = context.Aseguradoras.FromSqlRaw($"AseguradoraGetAll").ToList();

                    result.Objects = new List<object>();

                    if (aseguradoras != null)
                    {
                        foreach (var obj in aseguradoras)
                        {

                            ML.Aseguradora aseguradora = new ML.Aseguradora();

                            aseguradora.IdAseguradora = obj.IdAseguradora;
                            aseguradora.Nombre = obj.Nombre;
                            aseguradora.FechaCreacion = obj.FechaCreacion.ToString();
                            aseguradora.FechaModificacion = obj.FechaModificacion.ToString();
                            aseguradora.Usuario= new ML.Usuario();
                        
                            aseguradora.Usuario.IdUsuario = obj.IdUsuario.Value;
                            aseguradora.Usuario.Nombre = obj.UsuarioNombre;



                            result.Objects.Add(aseguradora);
                        }

                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se encontraron registros.";
                    }
                }
            }
            catch (Exception ex)
            {

                result.Correct = false;
                result.ErrorMessage = ex.Message;

            }

            return result;
        }
    }
}