import { Component, OnInit } from '@angular/core';

// imports
import { MatTableDataSource } from '@angular/material/table';
import { MepBloc, SuiviBloc } from 'src/app/interfaces/mep-bloc.model';
import { MepBlocService } from 'src/app/services/mep-bloc.service';
import { MV, NEW_DATA, PA, SG, VALIDATE } from 'src/app/utils/global-variable';

import * as _moment from 'moment';
import { animate, state, style, transition, trigger } from '@angular/animations';

const moment = _moment;

@Component({
  selector: 'app-mep-bloc',
  templateUrl: './mep-bloc.component.html',
  styleUrls: ['./mep-bloc.component.scss'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
})
export class MepBlocComponent implements OnInit {

// data 
data_suivi_bloc: SuiviBloc[] = [];
data_mep_bloc: MepBloc[] = [];

src_mep_sg: MepBloc[] = [];
src_mep_pa: MepBloc[] = [];
src_mep_mv: MepBloc[] = [];

src_new_mep_sg: MepBloc[] = [];
src_new_mep_pa: MepBloc[] = [];
src_new_mep_mv: MepBloc[] = [];

src_sv_sg: SuiviBloc[] = [];
src_sv_pa: SuiviBloc[] = [];
src_sv_mv: SuiviBloc[] = [];

src_new_sv_sg: SuiviBloc[] = [];
src_new_sv_pa: SuiviBloc[] = [];
src_new_sv_mv: SuiviBloc[] = [];

// displayed column Mep
displayedColumnsMepSg: string[] = ['annee', 'saison', 'code_mep', 'bloc', 'code_parce', 'sfce_reel', 'code_benef', 'nom', 'ddp', 'variette', 'qso', 'dds', 'sfce_embl', 'sc', 'ea', 'etat', 'action'];
displayedColumnsMepPa: string[] = ['annee', 'code_mep', 'bloc', 'code_parce', 'sfce_reel', 'code_benef', 'nom', 'ddp', 'dt_dist', 'espece', 'qso', 'dds', 'nbre_ligne', 'long_ligne', 'etat', 'action'];
displayedColumnsMepMv: string[] = ['annee', 'code_mep', 'bloc', 'code_parce', 'sfce_reel', 'code_benef', 'nom', 'ddp', 'espece', 'qso', 'dds', 'sfce_embl', 'sc', 'ea', 'etat', 'action'];
displayedColumnsNewMepSg: string[] = ['annee', 'saison', 'code_mep', 'bloc', 'code_parce', 'sfce_reel', 'code_benef', 'nom', 'ddp', 'variette', 'qso', 'dds', 'sfce_embl', 'sc', 'ea', 'etat', 'action'];
displayedColumnsNewMepPa: string[] = ['annee', 'code_mep', 'bloc', 'code_parce', 'sfce_reel', 'code_benef', 'nom', 'ddp', 'dt_dist', 'espece', 'qso', 'dds', 'nbre_ligne', 'long_ligne', 'etat', 'action'];
displayedColumnsNewMepMv: string[] = ['annee', 'code_mep', 'bloc', 'code_parce', 'sfce_reel', 'code_benef', 'nom', 'ddp', 'espece', 'qso', 'dds', 'sfce_embl', 'sc', 'ea', 'etat', 'action'];
// displayed new Sv
displayedColumnsNewSvSg: string[] = ['code_sv', 'bloc', 'parcelle', 'code_benef', 'nom', 'variette', 'qso', 'dds', 'sfce_embl', 'sc', 'ddp', 'stc', 'long_ligne', 'nbre_ligne', 'img', 'ex', 'etat', 'action'];
displayedColumnsNewSvPa: string[] = ['code_sv', 'bloc', 'parcelle', 'code_benef', 'nom', 'espece', 'dt_dist', 'qso', 'dds', 'nbre_ligne', 'long_ligne', 'ddp', 'ql', 'qr', 'hauteur', 'etat_pa', 'etat', 'action'];
displayedColumnsNewSvMv: string[] = ['code_sv', 'bloc', 'parcelle', 'code_benef', 'nom', 'espece', 'qso', 'dds', 'sfce_embl', 'sc', 'ddp', 'nbre_pied', 'Long_ligne', 'nbre_ligne', 'etat', 'action'];
// displayed column suivi
displayedColumnsSvSg: string[] = ['ddp', 'stc', 'long_ligne', 'nbre_ligne', 'img', 'ex', 'etat'];
displayedColumnsSvSvPa: string[] = ['code_sv', 'ddp', 'ql', 'qr', 'hauteur', 'etat_pa', 'etat'];
displayedColumnsSvMv: string[] = ['code_sv', 'ddp', 'nbre_pied', 'Long_ligne', 'nbre_ligne', 'etat'];
// data source Mep
dataSourceMepSg = new MatTableDataSource<MepBloc>();
dataSourceMepPa = new MatTableDataSource<MepBloc>();
dataSourceMepMv = new MatTableDataSource<MepBloc>();
// Data source New Mep
dataSourceNewMepSg = new MatTableDataSource<MepBloc>();
dataSourceNewMepPa = new MatTableDataSource<MepBloc>();
dataSourceNewMepMv = new MatTableDataSource<MepBloc>();
// Data source Suivi New suivi
dataSourceNewSvSg = new MatTableDataSource<SuiviBloc>();
dataSourceNewSvPa = new MatTableDataSource<SuiviBloc>();
dataSourceNewSvMv = new MatTableDataSource<SuiviBloc>();

isTableSgExpanded = false;
isTablePaExpanded = false;
isTableMvExpanded = false;

constructor(private mepService: MepBlocService) {
  this.fectMepBloc();
}
ngOnInit(): void {}

fectMepBloc() {
  this.mepService.getMepBloc().subscribe(res => {
    this.data_mep_bloc = res;
    // data mep validate
    let data_mep_sg: MepBloc[] = [];
    let data_mep_pa: MepBloc[] = [];
    let data_mep_mv: MepBloc[] = [];

    let mep_sg: MepBloc[] = [];
    let mep_pa: MepBloc[] = [];
    let mep_mv: MepBloc[] = [];

    if (this.data_mep_bloc.length > 0) {
      mep_sg = this.data_mep_bloc.filter(item => {return item.type === SG});
      mep_pa = this.data_mep_bloc.filter(item => {return item.type === PA});
      mep_mv = this.data_mep_bloc.filter(item => {return item.type === MV});

      if (mep_sg.length > 0) {
        data_mep_sg = mep_sg.filter(item => {return item.etat === VALIDATE});
        this.src_new_mep_sg = mep_sg.filter(item => {return item.etat === NEW_DATA});
        console.log("NEW SG :::", this.src_new_mep_sg);
        this.dataSourceNewMepSg.data = this.src_new_mep_sg;
      }
      if (mep_pa.length > 0) {
        data_mep_pa = mep_pa.filter(item => {return item.etat === VALIDATE});
        this.src_new_mep_pa = mep_pa.filter(item => {return item.etat === NEW_DATA});
        console.log("NEW PA :::", this.src_new_mep_pa);
        this.dataSourceNewMepPa.data = this.src_new_mep_pa;
      }
      if (mep_mv.length > 0) {
        data_mep_mv = mep_mv.filter(item => {return item.etat === VALIDATE});
        this.src_new_mep_mv = mep_mv.filter(item => {return item.etat === NEW_DATA});
        console.log("NEW MV :::", this.src_new_mep_mv);
        this.dataSourceNewMepMv.data = this.src_new_mep_mv;
      }
    }

    // load suivi
    this.mepService.getSvBloc().subscribe(res => {
      this.data_suivi_bloc = res;

      if (this.data_suivi_bloc.length > 0) {
        this.src_sv_sg = this.data_suivi_bloc.filter(item => {return item.type === SG});
        this.src_sv_pa = this.data_suivi_bloc.filter(item => {return item.type === PA});
        this.src_sv_mv = this.data_suivi_bloc.filter(item => {return item.type === MV});

        console.log("SV SG:::", this.src_sv_sg);
        console.log("SV PA:::", this.src_sv_pa);
        console.log("SV MV:::", this.src_sv_mv);

        if (this.src_sv_sg.length > 0) {
          this.src_new_sv_sg = this.src_sv_sg.filter(item => {return item.etat_sv === NEW_DATA});
          this.dataSourceNewSvSg.data = this.src_new_sv_sg;
        }
        if (this.src_sv_pa.length > 0) {
          this.src_new_sv_pa = this.src_sv_pa.filter(item => {return item.etat_sv === NEW_DATA});
          this.dataSourceNewSvPa.data = this.src_new_sv_pa;
        }
        if (this.src_sv_mv.length > 0) {
          this.src_new_sv_mv = this.src_sv_mv.filter(item => {return item.etat_sv === NEW_DATA});
          this.dataSourceNewSvMv.data = this.src_new_sv_mv;
        }
      }
      // load data sg
      data_mep_sg.forEach(elem_sg=> {
        elem_sg.suivimep_others = this.src_sv_sg.filter(item => {return item.id_culture === elem_sg.code_culture && item.etat_mep === VALIDATE && item.etat_sv === VALIDATE});
        this.src_mep_sg.push(elem_sg);
      });
      // load data pa
      data_mep_pa.forEach(elem_pa=> {
        elem_pa.suivimep_others = this.src_sv_pa.filter(item => {return item.id_culture === elem_pa.code_culture && item.etat_mep === VALIDATE && item.etat_sv === VALIDATE});
        this.src_mep_pa.push(elem_pa);
      });
      // load data mv
      data_mep_mv.forEach(elem_mv=> {
        elem_mv.suivimep_others = this.src_sv_mv.filter(item => {return item.id_culture === elem_mv.code_culture && item.etat_mep === VALIDATE && item.etat_sv === VALIDATE});
        this.src_mep_mv.push(elem_mv);
      });

      this.dataSourceMepSg.data = this.src_mep_sg;
      this.dataSourceMepPa.data = this.src_mep_pa;
      this.dataSourceMepMv.data = this.src_mep_mv;

      console.log("Suivi Bloc:::", this.data_suivi_bloc);
      console.log("MV VALIDATE:::", this.src_mep_sg);
      console.log("PA VALIDATE:::", this.src_mep_pa);
      console.log("SG VALIDATE:::", this.src_mep_pa);
    });

    console.log("Mep Bloc:::", this.data_mep_bloc);
  });
}

onViewSuivi(src: any) {
  
}
// Toggel Rows
toggleTableRows(src:any) {
  switch(src.src) {
    case 'mep-sg':
      this.isTableSgExpanded = !this.isTableSgExpanded;
      this.dataSourceMepSg.data.forEach((row: any) => {
        if (row.suivimep_others.length > 0) {
          row.isExpanded = this.isTableSgExpanded;
        } else {
          if (row.isExpanded) {
            row.isExpanded = false;
          }
        }
      });
      break;
    case 'mep-pa':
      this.isTablePaExpanded = !this.isTablePaExpanded;
      this.dataSourceMepPa.data.forEach((row: any) => {
        if (row.suivimep_others.length > 0) {
          row.isExpanded = this.isTablePaExpanded;
        } else {
          if (row.isExpanded) {
            row.isExpanded = false;
          }
        }
      });
      break;
    case 'mep-mv':
      this.isTableMvExpanded = !this.isTableMvExpanded;
      this.dataSourceMepMv.data.forEach((row: any) => {
        if (row.suivimep_others.length > 0) {
          row.isExpanded = this.isTableMvExpanded;
        } else {
          if (row.isExpanded) {
            row.isExpanded = false;
          }
        }
      });
      break
  }
}
}
