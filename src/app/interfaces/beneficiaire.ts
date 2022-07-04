export interface PR {
    img_benef: string, 
    nom: string, 
    prenom: string, 
    sexe: string, 
    dt_nais: string, 
    dt_nais_vers: string, 
    date_naissance: string,
    surnom: string, 
    cin: number, 
    img_cin: string, 
    contact: string, 
    id_fkt: string, 
    village: string, 
    code_region: string,
    nom_region: string,
    code_dist: string,
    nom_dist: string,
    code_commune: string,
    commune: string,
    fokontany: string,
    code_pr: string, 
    id_proj: string, 
    id_activ: number, 
    id_benef: string, 
    id_bloc: string, 
    bloc: string,
    code_achat: string, 
    id_collaborateur: string, 
    id_tech: number, 
    etat: string, 
    status: string,
    cep_pr: any[], // parcelle champs ecole des paysants relais
    isExpanded: boolean // si la ligne est expendable
}
export interface Cep_PR {
    code_pr: string, 
    code_parce: string, 
    id_bloc: string, 
    id_benef: string, 
    ref_gps: string,
    lat: number,
    log: number,
    superficie: number,
    id_commune: string,
    id_fkt: string,
    village: string,
    anne_adheran: string,
    dt_creation: string,
    etat: string,
    status: string,
    bloc_cep: string,
    code_region: string,
    nom_region: string,
    code_district: string,
    district: string,
    code_commune: string,
    commune: string,
    fokontany: string
}
export interface AnimationVe {
    code_benef: string,
    nom: string, 
    prenom: string, 
    code_pr: string, 
    code_achat: string, 
    code_anime: string, 
    id_pr: string, 
    id_fkt: string, 
    village: string, 
    date_anim: string, 
    nb_participant: number, 
    nb_h: number, 
    nb_f: number, 
    nb_inf_25: number, 
    type: string, 
    img_piece: string, 
    img_group_particip: string, 
    id_tech_recenseur: number, 
    etat: string, 
    status: string,
    nb_specu: number,
    somme_specu: number,
    code_reg: string,
    code_dist: string, 
    nom_dist: string, 
    code_commune: string, 
    commune: string, 
    fokontany: string,
    specu_animation: any[],
    isExpanded: boolean
}
export interface AnimationSpecu {
    code_specu: string, 
    id_anime_ve: string, 
    id_var: string, 
    id_espece: string, 
    quantite: number, 
    etat: string, 
    status: string,
    speculation: string
}