import { AfterContentInit, AfterViewInit, Component, DoCheck, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { PrComponent } from 'src/app/modules/ida/pr/pr.component';
import { GetterDataService } from 'src/app/services/getter-data.service';

@Component({
  selector: 'app-default',
  templateUrl: './default.component.html',
  styleUrls: ['./default.component.scss']
})
export class DefaultComponent implements OnInit, DoCheck {
  currentRoute: any = null;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private getterData: GetterDataService) {
      console.log("Default:::", this.getterData.getter());
    }
  /**
   * Life cycle
   */
  ngDoCheck() {
    console.log('Method ng Dochecked.');
    if (this.getterData.getter() != null) {
      this.currentRoute = this.getterData.getter().data
    }
  }

  ngOnInit(): void {
  }

  

}
