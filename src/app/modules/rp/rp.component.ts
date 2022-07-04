import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { GetterDataService } from 'src/app/services/getter-data.service';

@Component({
  selector: 'app-rp',
  templateUrl: './rp.component.html',
  styleUrls: ['./rp.component.scss']
})
export class RpComponent implements OnInit, OnDestroy {

  constructor(
    private router: Router,
    private getterData: GetterDataService
  ) { 
    if (this.router.getCurrentNavigation()?.extras.state) {
      console.log("get Current router::;", this.router.getCurrentNavigation()?.extras.state);
      this.getterData.setter(this.router.getCurrentNavigation()?.extras.state);
    }
   }
  ngOnDestroy() {
    this.getterData.setter(null);
  }

  ngOnInit(): void {
  }

}
