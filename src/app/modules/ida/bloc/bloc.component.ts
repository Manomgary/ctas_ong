import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { GetterDataService } from 'src/app/services/getter-data.service';

@Component({
  selector: 'app-bloc',
  templateUrl: './bloc.component.html',
  styleUrls: ['./bloc.component.scss']
})
export class BlocComponent implements OnInit, OnDestroy {

  constructor(
      private router: Router,
      private route: ActivatedRoute,
      private getterData: GetterDataService
    ) {
      if (this.router.getCurrentNavigation()?.extras.state) {
        console.log("Bloc current:::", this.router.getCurrentNavigation()?.extras.state);
        this.getterData.setter(this.router.getCurrentNavigation()?.extras.state);
      }
    }

  ngOnInit() {}

  ngOnDestroy() {
    this.getterData.setter(null);
  }

}
