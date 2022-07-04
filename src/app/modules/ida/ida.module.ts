import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AnimationVeComponent } from './animation-ve/animation-ve.component';
import { BeneficiaireBlocComponent } from './beneficiaire-bloc/beneficiaire-bloc.component';
import { BeneficiairePrComponent } from './beneficiaire-pr/beneficiaire-pr.component';
import { MepBlocComponent } from './mep-bloc/mep-bloc.component';
import { MepCepComponent } from './mep-cep/mep-cep.component';
import { BlocComponent } from './bloc/bloc.component';
import { PrComponent } from './pr/pr.component';
import { IdaComponent } from './ida.component';
import { AngularMaterialModule } from 'src/app/utils/angular-material.module';
import { RouterModule } from '@angular/router';
import { FlexLayoutModule } from '@angular/flex-layout';
import { CustomDatePipe } from 'src/app/utils/custom.datepipe';



@NgModule({
  declarations: [
    AnimationVeComponent,
    BeneficiaireBlocComponent,
    BeneficiairePrComponent,
    MepBlocComponent,
    MepCepComponent,
    BlocComponent,
    PrComponent,
    IdaComponent,
    CustomDatePipe,
  ],
  imports: [
    CommonModule,
    AngularMaterialModule,
    RouterModule,
    FlexLayoutModule
  ]
})
export class IdaModule { }
