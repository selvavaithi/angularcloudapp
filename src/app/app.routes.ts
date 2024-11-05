import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { HomeComponent } from './home/home.component';
import { ContactComponent } from './contact/contact.component';

export const routes: Routes = [
{path:'login', component:LoginComponent},
{path:'signup', component:SignUpComponent},
{path:'home', component:HomeComponent},
{path:'contact', component:ContactComponent},
{path:'', redirectTo:'/home', pathMatch:'full'}

];
