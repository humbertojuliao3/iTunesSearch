//
//  CellDetailViewController.h
//  iTunesSearch
//
//  Created by Humberto  Julião on 13/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//
#import "Filme.h"
#import <UIKit/UIKit.h>

@interface CellDetailViewController : UIViewController
@property (nonatomic,strong) NSArray* item;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet UILabel *artista;

@property (weak, nonatomic) IBOutlet UILabel *genero;
@property (weak, nonatomic) IBOutlet UILabel *pais;
@property (weak, nonatomic) IBOutlet UILabel *tipo;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;


@end
