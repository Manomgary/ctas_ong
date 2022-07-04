import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BASE_PATH } from '../utils/global-variable';

@Injectable({
  providedIn: 'root'
})
export class BeneficiaireService {
  private endPoint = BASE_PATH;

  constructor(private httpClient: HttpClient) { }

  private httpHeader = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  }

  // get Beneficiaire PR
  getPRBloc(): Observable<any> {
    let data: any;
    return this.httpClient.post<any>(this.endPoint + 'beneficiaire/findPrBloc', data, this.httpHeader);
  }
  // get Parcelle Beneficiaire PR
  getParcePR(): Observable<any> {
    let data: any;
    return this.httpClient.post<any>(this.endPoint + 'parcelle/findParcePRBloc', data, this.httpHeader);
  }
  // get Animation Ve
  getAnimationVe(): Observable<any> {
    let data: any;
    return this.httpClient.post<any>(this.endPoint + 'beneficiaire/findAnimation', data, this.httpHeader);
  }
  // get Animation Ve
  getAnimationSpecu(): Observable<any> {
    let data: any;
    return this.httpClient.post<any>(this.endPoint + 'beneficiaire/findAnimation_specu', data, this.httpHeader);
  }
}
