//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "CellDetailViewController.h"

@interface TableViewController () {
    NSMutableArray *midias;
    NSMutableArray *sec1song;
    NSMutableArray *sec2movie;
    NSMutableArray *sec3tv;
    NSMutableArray *sec4podcast;
//    NSMutableArray *sec5itens;
    
}

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    iTunesManager *itunes = [iTunesManager sharedInstance];
    midias = [itunes buscarMidias:@""];
    for (int i=0; i<[midias count]; i++) {
        int resp;
        if ([[[[midias objectAtIndex:i] tipo]text] isEqual:@"song"]) {
            resp=0;
        }else if ([[[[midias objectAtIndex:i] tipo]text] isEqual:@"feature-movie"]){
            resp=1;
        }else if ([[[[midias objectAtIndex:i] tipo]text] isEqual:@"tv-episode"]){
            resp=2;
        }else if ([[[[midias objectAtIndex:i] tipo]text] isEqual:@"podcast"]){
            resp=3;
        }

    switch (resp) {
        case 0:
            [sec1song addObject:[midias objectAtIndex:i]];
            break;
        case 1:
            [sec2movie addObject:[midias objectAtIndex:i]];
            break;
        case 2:
            [sec3tv addObject:[midias objectAtIndex:i]];
            break;
        case 3:
            [sec4podcast addObject:[midias objectAtIndex:i]];
            break;
            
        default:
            
            break;
    }
    }
    
    sec1song=[NSMutableArray array];
    sec2movie=[NSMutableArray array];
    sec3tv=[NSMutableArray array];
    sec4podcast=[NSMutableArray array];
    
    
#warning Necessario para que a table view tenha um espaco em relacao ao topo, pois caso contrario o texto ficara atras da barra superior
 
    //self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableview.bounds.size.width, 15.f)];

}
#pragma mark - searchBar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    iTunesManager *itunes = [iTunesManager sharedInstance];
    midias = [itunes buscarMidias:searchBar.text];
    for (int i=0; i<[midias count]; i++) {
        int resp;
        if ([[[midias objectAtIndex:i]tipo]  isEqual:@"song"]) {
            resp=0;
        }else if ([[[midias objectAtIndex:i] tipo] isEqual:@"feature-movie"]){
            resp=1;
        }else if ([[[midias objectAtIndex:i] tipo] isEqual:@"tv-episode"]){
            resp=2;
        }else if ([[[midias objectAtIndex:i] tipo] isEqual:@"podcast"]){
            resp=3;
        }
        
        switch (resp) {
            case 0:
                [sec1song addObject:[midias objectAtIndex:i]];
                break;
            case 1:
                [sec2movie addObject:[midias objectAtIndex:i]];
                break;
            case 2:
                [sec3tv addObject:[midias objectAtIndex:i]];
                break;
            case 3:
                [sec4podcast addObject:[midias objectAtIndex:i]];
                break;
                
            default:
                
                break;
        }
    }
    //Filme *filme = [midias objectAtIndex:indexPath.row];
    //filmes = [[iTunesManager sharedInstance]buscarMidias:searchBar.text];
    [self.tableview reloadData];
    [searchBar resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [sec1song count];
            break;
        case 1:
            return [sec2movie count];
            break;
        case 2:
            return [sec3tv count];
            break;
        case 3:
            return [sec4podcast count];
            break;
            
        default:
            return 0;
            break;
    }

}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return NSLocalizedString(@"Music",);
            break;
        case 1:
            return NSLocalizedString(@"Movie",);
            break;
        case 2:
            return NSLocalizedString(@"TV",);
            break;
        case 3:
            return NSLocalizedString(@"Podcast",);
            break;
        default:
            return @"Default";
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
//    Filme *filme = [midias objectAtIndex:indexPath.row];
    NSMutableArray* operador=[[NSMutableArray alloc] init];
    midias = nil;
    [operador addObjectsFromArray:sec1song];
    [operador addObjectsFromArray:sec2movie];
    [operador addObjectsFromArray:sec3tv];
    [operador addObjectsFromArray:sec4podcast];
    midias=operador;
    
    switch (indexPath.section) {
        case 0:
            celula.nome.text =NSLocalizedString([[midias objectAtIndex:indexPath.row] nome],);
            celula.tipo.text = NSLocalizedString([[midias objectAtIndex:indexPath.row] tipo],);
            celula.genero.text = NSLocalizedString([[midias objectAtIndex:indexPath.row] genero],);
//            [celula.imagem setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[midias objectAtIndex:indexPath.row] imagemMini]]]]] ;
            break;
        case 1:
            celula.nome.text =NSLocalizedString( [[midias objectAtIndex:indexPath.row] nome],);
            celula.tipo.text = NSLocalizedString([[midias objectAtIndex:indexPath.row] tipo],);
            celula.genero.text = NSLocalizedString([[midias objectAtIndex:indexPath.row] genero],);
//            [celula.imagem setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[midias objectAtIndex:indexPath.row] imagemMini]]]]] ;
            break;
        case 2:
            celula.nome.text = NSLocalizedString([[midias objectAtIndex:indexPath.row] nome],);
            celula.tipo.text = NSLocalizedString([[midias objectAtIndex:indexPath.row] tipo],);
            celula.genero.text = NSLocalizedString([[midias objectAtIndex:indexPath.row] genero],);
//           [celula.imagem setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[midias objectAtIndex:indexPath.row] imagemMini]]]]] ;
            break;
        case 3:
            celula.nome.text = NSLocalizedString([[midias objectAtIndex:indexPath.row] nome],) ;
            celula.tipo.text = NSLocalizedString([[midias objectAtIndex:indexPath.row] tipo],) ;
            celula.genero.text =NSLocalizedString( [[midias objectAtIndex:indexPath.row] genero],);
//            [celula.imagem setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[midias objectAtIndex:indexPath.row] imagemMini]]]]] ;
            break;
        default:
            break;
    }
    
    
//    [celula.nome setText:filme.nome];
//    [celula.tipo setText:NSLocalizedString(filme.tipo,@"seta o tipo para um valor comum")];
//    [celula.genero setText:filme.genero];
    
    return celula;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CellDetailViewController*detail =[[CellDetailViewController alloc] init];
    Filme*item=[midias objectAtIndex:indexPath.row];
    NSArray*part=[[NSArray alloc] initWithObjects:item.nome,item.artista,item.genero,item.pais,item.tipo,item.imagem, nil];
    detail.item=part;
    [self.navigationController pushViewController:detail animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}



@end
