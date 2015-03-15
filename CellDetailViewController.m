//
//  CellDetailViewController.m
//  iTunesSearch
//
//  Created by Humberto  Julião on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "CellDetailViewController.h"
#import "iTunesManager.h"
#import "Filme.h"

@interface CellDetailViewController ()

@end

@implementation CellDetailViewController
@synthesize titulo,artista,genero,pais,tipo;
/*
- (void)viewDidLoad {
    [super viewDidLoad];
    iTunesManager *itunes = [iTunesManager sharedInstance];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)viewWillAppear:(BOOL)animated{
    
    NSArray*resp=self.item;
    
    titulo.text = [resp objectAtIndex:0];
    artista.text = [resp objectAtIndex:1];
    genero.text = [resp objectAtIndex:2];
    pais.text = [resp objectAtIndex:3];
    tipo.text = [resp objectAtIndex:4];
//    NSLog(titulo.text);
//    NSLog(artista.text);
//    NSLog(genero.text);
//    NSLog(pais.text);
//    NSLog(tipo.text);
//    [self reloadInputViews];
    [self.imagem setImage: [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[resp objectAtIndex:5]]]]];

}

@end
