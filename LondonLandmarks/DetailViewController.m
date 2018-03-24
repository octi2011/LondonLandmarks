//
//  DetailViewController.m
//  LondonLandmarks
//
//  Created by Duminica Octavian on 24/03/2018.
//  Copyright © 2018 Duminica Octavian. All rights reserved.
//

#import "DetailViewController.h"
#import "MapPin.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.detailModal[0];
    self.detailTitle.text = self.detailModal[0];
    self.detailDescription.text = self.detailModal[1];
    self.detailImage.image = [UIImage imageNamed:self.detailModal[2]];
    
    self.dirButton.layer.cornerRadius = 5.0;
    self.mapView.layer.cornerRadius = 5.0;
    
    if ([self.detailTitle.text isEqualToString:@"Big Ben"]) {
        self.detailTextView.text = @"16-storey Gothic clocktower and national symbol at the Eastern end of the Houses of Parliament.";
        
        latitude = 51.50072919999999;
        longitude = -0.12462540000001354;
    }
    
    if ([self.detailTitle.text isEqualToString:@"Westminster Abbey"]) {
        self.detailTextView.text = @"Protestant abbey hosting daily services and every English and British coronation since 1066.";
        
        latitude = 51.4994174;
        longitude = -0.1275705000000471;
    }
    
    if ([self.detailTitle.text isEqualToString:@"Buckingham Palace"]) {
        self.detailTextView.text = @"Visitors can tour the palace's opulent private and state rooms or watch the changing of the guard.";
        
        latitude = 51.501364;
        longitude = -0.1418899999999894;
    }
    
    if ([self.detailTitle.text isEqualToString:@"London Eye"]) {
        self.detailTextView.text = @"Huge observation wheel giving passengers a privileged bird's-eye view of the city's landmarks.";
        
        latitude = 51.50090949999999;
        longitude = -0.11953229999994619;
    }
    
    if ([self.detailTitle.text isEqualToString:@"St. Pauls Cathedral"]) {
        self.detailTextView.text = @"Churchyard and gardens outside Saint Paul's cathedral, with a floor-plan of the original building.";
        
        latitude = 51.513191;
        longitude = -0.09759899999994559;
    }
    
    if ([self.detailTitle.text isEqualToString:@"Tower Bridge"]) {
        self.detailTextView.text = @"Panoramic views from high level walkways and behind-the-scenes access to original lifting machinery.";
        
        latitude = 51.50516;
        longitude = -0.07557599999995546;
    }
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    
    CLLocationCoordinate2D location;
    
    location.latitude = latitude;
    location.longitude = longitude;
    
    region.span = span;
    region.center = location;
    
    [self.mapView setRegion:region animated:YES];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.coordinate = location;
    
    [self.mapView addAnnotation:ann];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)directions:(id)sender {
    NSString *url = [NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%f,%f", latitude, longitude];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
}
@end
