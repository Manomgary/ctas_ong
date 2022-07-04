import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DefaultComponent } from './default.component';
import { RpComponent } from 'src/app/modules/rp/rp.component';
import { BiComponent } from 'src/app/modules/bi/bi.component';
import { FlexLayoutModule } from '@angular/flex-layout';
import { RouterModule } from '@angular/router';

import { AngularMaterialModule } from 'src/app/utils/angular-material.module';
import { SharedModule } from 'src/app/shared/shared.module';
import { MepComponent } from 'src/app/modules/mep/mep.component';
import { IdaModule } from 'src/app/modules/ida/ida.module';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    DefaultComponent,
    RpComponent,
    BiComponent,
    MepComponent],
  imports: [
    CommonModule,
    RouterModule,
    FormsModule,
    AngularMaterialModule,
    SharedModule,
    IdaModule,
    FlexLayoutModule
  ]
})
export class DefaultModule { }