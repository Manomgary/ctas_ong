import { animate, state, style, transition, trigger } from '@angular/animations';
import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { AnimationSpecu, AnimationVe } from 'src/app/interfaces/beneficiaire';
import { BeneficiaireService } from 'src/app/services/beneficiaire.service';

@Component({
  selector: 'app-animation-ve',
  templateUrl: './animation-ve.component.html',
  styleUrls: ['./animation-ve.component.scss'],
  animations: [ //utiliser pour @detailExpand (table expendable)
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ])
  ]
})
export class AnimationVeComponent implements OnInit {
  private data_animation_ve: AnimationVe[] = [];
  private data_anime_specu: AnimationSpecu[] = [];

  // displayed columns
  displayedColumnsAnimeVe: string[] = ['code_pr', 'nom', 'code_anime', 'date_anime', 'commune', 'fokontany', 'nb_participant', 'nb_f', 'nb_h', 'nb-25', 'nb_specu', 'quantite', 'img_pièce', 'action'];
  displayedColumnsSpecu: string[] = ['speculation', 'quantite'];

  // data source Mep
  dataSourceAnimationVe = new MatTableDataSource<AnimationVe>();
  
  isTableAnimationExpanded = false;

  constructor(private benefService: BeneficiaireService) {}

  ngOnInit(): void {
    this.loadAnimation();
  }

  loadAnimation() {
    this.benefService.getAnimationSpecu().subscribe(res => {
      console.log(":::::Load Animation Specu::::", res);
      this.data_anime_specu = res;
    });
    this.benefService.getAnimationVe().subscribe(res => {
      console.log(":::::Load Animation Ve:::", res);
      this.data_animation_ve = res;
      
      if (this.data_animation_ve.length > 0) {
        this.data_animation_ve.forEach(item => {
          item.specu_animation = this.data_anime_specu.filter(item_specu => {return item_specu.id_anime_ve === item.code_anime});
        });
      }
      this.dataSourceAnimationVe.data = this.data_animation_ve;
      console.log(":::::Load Animation Ve With elem:::", this.data_animation_ve);
    });
  }

  toggleTableRows() {
    this.isTableAnimationExpanded = !this.isTableAnimationExpanded;
    this.dataSourceAnimationVe.data.forEach(row => {
      if (row.specu_animation.length > 0) {
        row.isExpanded = this.isTableAnimationExpanded;
      } else {
        if (row.isExpanded) {
          row.isExpanded = false;
        }
      }
    });
  }

}
