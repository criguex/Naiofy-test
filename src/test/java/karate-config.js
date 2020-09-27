function config() {
   karate.configure('connectTimeout', 20000);
   karate.configure('readTimeout', 20000);

  var config = {

	pageUrl :"https://nodejs-qa-training.herokuapp.com/",
    regularUser: "cristianregular@wolox.com.ar",
    adminUser: "cristianadmin@wolox.com.ar",
    clave: "candidatoWolox2020",
  }

    return config;
}