import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FullWidthComponent } from './full-width.component';
import { RouterModule } from '@angular/router';
import { FlexLayoutModule } from '@angular/flex-layout';
import { AngularMaterialModule } from 'src/app/utils/angular-material.module';
import { SharedModule } from 'src/app/shared/shared.module';
import { UtilisateurComponent } from 'src/app/modules/utilisateur/utilisateur.component';
import { HomeComponent } from 'src/app/modules/home/home.component';



@NgModule({
  declarations: [
    FullWidthComponent,
    UtilisateurComponent,
    HomeComponent,
  ],
  imports: [
    CommonModule,
    RouterModule,
    AngularMaterialModule,
    SharedModule,
    FlexLayoutModule
  ]
})
export class FullWidthModule { }
