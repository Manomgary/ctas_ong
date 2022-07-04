import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BASE_PATH } from '../utils/global-variable';

@Injectable({
  providedIn: 'root'
})
export class MepBlocService {
  endPoint = BASE_PATH;

  constructor(private httpClient: HttpClient) { }

  htpHeader = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  }

  getMepBloc(): Observable<any> {
    return this.httpClient.get<any>(this.endPoint + 'culture/find_mep_bloc_wb');
  }
  getSvBloc(): Observable<any> {
    return this.httpClient.get<any>(this.endPoint + 'culture/find_suivi_bloc_wb');
  }
}
