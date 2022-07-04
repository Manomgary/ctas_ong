import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class GetterDataService {
  private data_: any = null;

  constructor() {}

  setter(data: any) {
    this.data_ = data;
  }
  getter() {
    return this.data_;
  }
}
