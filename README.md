# AtmaVer
A project aims one of UN 17 sustainable development goals for Google Solution Challange 2021. 

It uses .Net Core Web Api for back-end techs. and Flutter for front-end side. Firebase is used for google auth and google maps for get users location informations.

# Instructions for build
P.S: In app we are not using local project. So if you don't need to check Web Api you can step 3 directly.
1- Go to folder with "cd AtmaVer.Api"
2- Type "dotnet watch run" in terminal (You don't need to setup your own DB. We are using a online one. But if you want to use your own go to DB Settings down below)
3- Run Flutter project under the AtmaVer.FlutterApp folder


DB Settings:
For create your own DB you should change strings in AtmaVer.Data/DAL/ApplicationDbContextFactory.cs and AtmaVer.Api/appsettings.json. After than you have to apply migrations to your DB so go to folder AtmaVer.Data and type "dotnet ef database update" in terminal. That's all.
