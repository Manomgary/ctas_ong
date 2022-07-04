import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LoginComponent } from 'src/app/modules/login/login.component';
import { RouterModule } from '@angular/router';
import { AngularMaterialModule } from 'src/app/utils/angular-material.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { LoginLayoutComponent } from './login-layout.component';



@NgModule({
  declarations: [
    LoginLayoutComponent,
    LoginComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    AngularMaterialModule,
    FlexLayoutModule
  ]
})
export class LoginLayoutModule { }
