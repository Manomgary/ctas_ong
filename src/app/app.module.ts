import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

// Import
import { HttpClientModule } from '@angular/common/http';
import { DefaultModule } from './layouts/default/default.module';
import { FullWidthModule } from './layouts/full-width/full-width.module';
import { LoginLayoutModule } from './layouts/login-layout/login-layout.module';
import { CustomDatePipe } from './utils/custom.datepipe';
import { FourOfFourComponent } from './modules/four-of-four/four-of-four.component';

@NgModule({
  declarations: [
    AppComponent,
    FourOfFourComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    DefaultModule,
    FullWidthModule,
    LoginLayoutModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
