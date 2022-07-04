import { animate, state, style, transition, trigger } from '@angular/animations';
import { AfterViewInit, Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Cep_PR, PR } from 'src/app/interfaces/beneficiaire';
import { BeneficiaireService } from 'src/app/services/beneficiaire.service';

@Component({
  selector: 'app-beneficiaire-pr',
  templateUrl: './beneficiaire-pr.component.html',
  styleUrls: ['./beneficiaire-pr.component.scss'],
  animations: [ //utiliser pour @detailExpand (table expendable)
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ])
  ]
})
export class BeneficiairePrComponent implements OnInit, AfterViewInit {
  private data_pr: PR[] = [];
  private data_parce: Cep_PR[] = [];
  
  displayedColumnsPR: string[] = ['code_pr', 'code_achat', 'nom', 'sexe', 'surnom', 'cin', 'commune', 'fokontany', 'action'];
  displayedColumnsParce: string[] = ['code_parce', 'bloc', 'ref_gps', 'lat', 'log', 'superficie', 'commune', 'fokontany']

  // data source Mep
  dataSourcePR = new MatTableDataSource<PR>();
  //dataSourceParce = new MatTableDataSource<Cep_PR>();

  isTablePRExpanded = false;

  constructor(private benefService: BeneficiaireService) {
    this.loadPR();
    //this.loadParcePR();
  }
  ngAfterViewInit() {
  }

  ngOnInit(): void {
    
  }

  loadPR() {
    this.benefService.getParcePR().subscribe(res => {
      console.log("Response Parcele PR::", res);
      this.data_parce = res;
      console.log("PR::::", this.data_parce);
    });
    this.benefService.getPRBloc().subscribe(res => {
      console.log("Response PR::", res);
      this.data_pr = res;
      //this.dataSourcePR.data = this.data_pr;
      //console.log("Parce PR::::", this.dataSourcePR.data);
      if (this.data_pr.length > 0) {
        this.data_pr.forEach((item, i) => {
          if (this.data_parce.length > 0) {
            item.cep_pr = this.data_parce.filter(elem_parce => {return elem_parce.code_pr === item.code_pr});
          } else item.cep_pr = [];
        });
      }
      this.dataSourcePR.data = this.data_pr;
      console.log("Parce PR::::", this.dataSourcePR.data);
    });
  }

  loadParcePR() {
    this.benefService.getParcePR().subscribe(res => {
      console.log("Response Parcele PR::", res);
      this.data_parce = res;
      console.log("PR::::", this.data_parce);
    });
  }

  toggleTableRows() {
    this.isTablePRExpanded = !this.isTablePRExpanded;
    this.dataSourcePR.data.forEach(row => {
      if (row.cep_pr.length > 0) {
        row.isExpanded = this.isTablePRExpanded;
      } else {
        if (row.isExpanded) {
          row.isExpanded = false;
        }
      }
    });
  }

}
