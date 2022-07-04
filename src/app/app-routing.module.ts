import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DefaultComponent } from './layouts/default/default.component';
import { FullWidthComponent } from './layouts/full-width/full-width.component';
import { LoginLayoutComponent } from './layouts/login-layout/login-layout.component';
import { BiComponent } from './modules/bi/bi.component';
import { FourOfFourComponent } from './modules/four-of-four/four-of-four.component';
import { HomeComponent } from './modules/home/home.component';
import { AnimationVeComponent } from './modules/ida/animation-ve/animation-ve.component';
import { BeneficiaireBlocComponent } from './modules/ida/beneficiaire-bloc/beneficiaire-bloc.component';
import { BeneficiairePrComponent } from './modules/ida/beneficiaire-pr/beneficiaire-pr.component';
import { BlocComponent } from './modules/ida/bloc/bloc.component';
import { IdaComponent } from './modules/ida/ida.component';
import { MepBlocComponent } from './modules/ida/mep-bloc/mep-bloc.component';
import { MepCepComponent } from './modules/ida/mep-cep/mep-cep.component';
import { PrComponent } from './modules/ida/pr/pr.component';
import { LoginComponent } from './modules/login/login.component';
import { MepComponent } from './modules/mep/mep.component';
import { RpComponent } from './modules/rp/rp.component';
import { UtilisateurComponent } from './modules/utilisateur/utilisateur.component';
import { AuthGardService } from './services/auth-gard.service';

const routes: Routes = [
  {
    path: '',
    component: FullWidthComponent,
    canActivate: [AuthGardService],
    children: [
      {
        path: 'home',
        component: HomeComponent
      },
      {
        path: 'users',
        component: UtilisateurComponent
      }
    ]
  },
  {
    path: '',
    component: DefaultComponent,
    canActivate: [AuthGardService],
    children: [
      {
        path: 'ida',
        component: IdaComponent,
        children: [
          {
            path: 'bloc',
            component: BlocComponent,
            children: [
              {
                path: '',
                component: BeneficiaireBlocComponent
              },
              {
                path: 'mep',
                component: MepBlocComponent
              }
            ]
          },
          {
            path: 'pr',
            component: PrComponent,
            children: [
              {
                path: '',
                component: BeneficiairePrComponent
              },
              {
                path: 'animation',
                component: AnimationVeComponent
              },
              {
                path: 'mep',
                component: MepCepComponent
              }
            ]
          }
        ]
      },
      {
        path: 'rp',
        component: RpComponent
      },
      {
        path: 'bi',
        component: BiComponent
      }
    ]
  },
  {
    path: '',
    component: LoginLayoutComponent,
    children: [
      {
        path: 'login',
        component: LoginComponent
      }
    ]
  },
  {
    path: 'not-found',
    component: FourOfFourComponent
  },
  {
    path: '**',
    redirectTo: 'not-found'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
