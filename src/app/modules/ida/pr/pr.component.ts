import { Component, EventEmitter, OnDestroy, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { GetterDataService } from 'src/app/services/getter-data.service';

@Component({
  selector: 'app-pr',
  templateUrl: './pr.component.html',
  styleUrls: ['./pr.component.scss']
})
export class PrComponent implements OnInit, OnDestroy {
  @Output('prComponent') data = new EventEmitter<any>();

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private getterData: GetterDataService
    ) {
      if (this.router.getCurrentNavigation()?.extras.state) {
        console.log("PR current:::", this.router.getCurrentNavigation()?.extras.state);
        this.getterData.setter(this.router.getCurrentNavigation()?.extras.state);
      }
    }

  ngOnDestroy() {
    //console.log("On destroy Pr Component:::",);
    this.getterData.setter(null);
  }

  ngOnInit(): void {}

}
