import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { GetterDataService } from 'src/app/services/getter-data.service';

@Component({
  selector: 'app-bi',
  templateUrl: './bi.component.html',
  styleUrls: ['./bi.component.scss']
})
export class BiComponent implements OnInit, OnDestroy {

  constructor(
    private router: Router,
    private getterService: GetterDataService
  ) { 
    if (this.router.getCurrentNavigation()?.extras.state) {
      console.log("data current router:::", this.router.getCurrentNavigation()?.extras.state);
      this.getterService.setter(this.router.getCurrentNavigation()?.extras.state);
    }
  }
  ngOnDestroy() {
    this.getterService.setter(null);
  }

  ngOnInit(): void {
  }

}
