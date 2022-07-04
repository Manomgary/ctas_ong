import { AfterViewInit, Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { GetterDataService } from 'src/app/services/getter-data.service';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit, OnChanges {
  @Input() activeRoute = null;

  constructor(
    private getterData: GetterDataService
  ) {}
  ngOnChanges(changes: SimpleChanges) {
    console.log('ngOnChanges Methode', changes);
    console.log('ngOnChanges Methode', this.activeRoute);
  }

  ngOnInit() {}


}
