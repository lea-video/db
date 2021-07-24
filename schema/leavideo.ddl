CREATE TABLE Playlist (
  playlistID int(10) NOT NULL AUTO_INCREMENT, 
  PRIMARY KEY (playlistID));
CREATE TABLE PlaylistItem (
  playlistItemID int(10) NOT NULL AUTO_INCREMENT, 
  playlistID     int(10) NOT NULL, 
  galerieID      int(10), 
  videoID        int(10), 
  PRIMARY KEY (playlistItemID));
CREATE TABLE Galerie (
  galerieID int(10) NOT NULL AUTO_INCREMENT, 
  PRIMARY KEY (galerieID));
CREATE TABLE Picture (
  pictureID int(10) NOT NULL AUTO_INCREMENT, 
  width     int(10), 
  height    int(10), 
  format    varchar(10), 
  PRIMARY KEY (pictureID));
CREATE TABLE Galerie_Picture (
  galerieID int(10) NOT NULL, 
  pictureID int(10) NOT NULL, 
  PRIMARY KEY (galerieID, 
  pictureID));
CREATE TABLE Video (
  videoID            int(10) NOT NULL AUTO_INCREMENT, 
  lengthSeconds      int(10) NOT NULL, 
  thumbnailPictureID int(10), 
  PRIMARY KEY (videoID));
CREATE TABLE Movie (
  videoID int(10), 
  imdbID  char(9) NOT NULL);
CREATE TABLE `Tag` (
  tagID       int(10) NOT NULL AUTO_INCREMENT, 
  parentTagID int(10), 
  defaultTag  tinyint(1), 
  PRIMARY KEY (tagID));
CREATE TABLE Tag_Video (
  tagID   int(10) NOT NULL, 
  videoID int(10) NOT NULL, 
  PRIMARY KEY (tagID, 
  videoID));
CREATE TABLE Tag_Picture (
  tagID     int(10) NOT NULL, 
  pictureID int(10) NOT NULL, 
  PRIMARY KEY (tagID, 
  pictureID));
CREATE TABLE Tag_Galerie (
  tagID     int(10) NOT NULL, 
  galerieID int(10) NOT NULL, 
  PRIMARY KEY (tagID, 
  galerieID));
CREATE TABLE Tag_Playlist (
  tagID      int(10) NOT NULL, 
  playlistID int(10) NOT NULL, 
  PRIMARY KEY (tagID, 
  playlistID));
CREATE TABLE Media (
  mediaID       int(10) NOT NULL AUTO_INCREMENT, 
  VideovideoID  int(10) NOT NULL, 
  hasAudio      tinyint(1) NOT NULL, 
  audioBitrate  int(10) NOT NULL, 
  audioEncoding varchar(10) NOT NULL, 
  hasVideo      tinyint(1) NOT NULL, 
  videoBitrate  int(10) NOT NULL, 
  videoEncoding varchar(10) NOT NULL, 
  PRIMARY KEY (mediaID));
CREATE TABLE Snippet (
  startFrame    int(10) NOT NULL, 
  endFrame      int(10) NOT NULL, 
  sourceVideoID int(10) NOT NULL, 
  videoID       int(10) NOT NULL);
CREATE TABLE Celebrity (
  celebrityID     int(10) NOT NULL AUTO_INCREMENT, 
  avatarPictureID int(10), 
  PRIMARY KEY (celebrityID));
CREATE TABLE Name (
  nameID   int(10) NOT NULL AUTO_INCREMENT, 
  language char(3), 
  name     varchar(255), 
  PRIMARY KEY (nameID));
CREATE TABLE Regisseur (
  celebrityID int(10) NOT NULL, 
  videoID     int(10) NOT NULL, 
  PRIMARY KEY (celebrityID, 
  videoID));
CREATE TABLE Actor (
  videoID     int(10) NOT NULL, 
  celebrityID int(10) NOT NULL, 
  PRIMARY KEY (videoID, 
  celebrityID));
CREATE TABLE Playlist_Name (
  playlistID int(10) NOT NULL, 
  nameID     int(10) NOT NULL, 
  PRIMARY KEY (playlistID, 
  nameID));
CREATE TABLE Galerie_Name (
  galerieID int(10) NOT NULL, 
  nameID    int(10) NOT NULL, 
  PRIMARY KEY (galerieID, 
  nameID));
CREATE TABLE Picture_Name (
  pictureID int(10) NOT NULL, 
  nameID    int(10) NOT NULL, 
  PRIMARY KEY (pictureID, 
  nameID));
CREATE TABLE Tag_Name (
  tagID  int(10) NOT NULL, 
  nameID int(10) NOT NULL, 
  PRIMARY KEY (tagID, 
  nameID));
CREATE TABLE Video_Name (
  videoID int(10) NOT NULL, 
  nameID  int(10) NOT NULL, 
  PRIMARY KEY (videoID, 
  nameID));
CREATE TABLE Name_Celebrity (
  nameID      int(10) NOT NULL, 
  celebrityID int(10) NOT NULL, 
  PRIMARY KEY (nameID, 
  celebrityID));
CREATE TABLE Celebrity_Picture (
  celebrityID int(10) NOT NULL, 
  pictureID   int(10) NOT NULL, 
  PRIMARY KEY (celebrityID, 
  pictureID));
CREATE TABLE Celebrity_Tag (
  celebrityID int(10) NOT NULL, 
  tagID       int(10) NOT NULL, 
  PRIMARY KEY (celebrityID, 
  tagID));
CREATE TABLE Artist (
  videoID     int(10) NOT NULL, 
  celebrityID int(10) NOT NULL, 
  PRIMARY KEY (videoID, 
  celebrityID));
CREATE TABLE Variation (
  variationID int(10) NOT NULL AUTO_INCREMENT, 
  PRIMARY KEY (variationID));
CREATE TABLE Video_Variation (
  videoID        int(10) NOT NULL, 
  variationID    int(10) NOT NULL, 
  isDefaultVideo tinyint(1) NOT NULL, 
  isDefaultAudio tinyint(1) NOT NULL, 
  PRIMARY KEY (videoID, 
  variationID));
CREATE TABLE Variation_Name (
  nameID      int(10) NOT NULL, 
  variationID int(10) NOT NULL, 
  PRIMARY KEY (nameID, 
  variationID));
CREATE TABLE `User` (
  userID   int(10) NOT NULL AUTO_INCREMENT, 
  password varchar(255), 
  salt     char(88), 
  PRIMARY KEY (userID));
CREATE TABLE `Group` (
  groupID       int(10) NOT NULL AUTO_INCREMENT, 
  parentGroupID int(10) NOT NULL, 
  PRIMARY KEY (groupID));
CREATE TABLE User_Group (
  userID  int(10) NOT NULL, 
  groupID int(10) NOT NULL, 
  PRIMARY KEY (userID, 
  groupID));
CREATE TABLE Tag_Group (
  tagID   int(10) NOT NULL, 
  groupID int(10) NOT NULL, 
  PRIMARY KEY (tagID, 
  groupID));
CREATE VIEW VideoView AS
SELECT
	EXISTS(Movie.videoID) AS isMovie,
	Video.*
FROM
	Video LEFT JOIN
	Movie ON Video.videoID = Movie.videoID;
ALTER TABLE PlaylistItem ADD CONSTRAINT FKPlaylistIt882042 FOREIGN KEY (playlistID) REFERENCES Playlist (playlistID);
ALTER TABLE Galerie_Picture ADD CONSTRAINT FKGalerie_Pi777235 FOREIGN KEY (galerieID) REFERENCES Galerie (galerieID);
ALTER TABLE Galerie_Picture ADD CONSTRAINT FKGalerie_Pi915795 FOREIGN KEY (pictureID) REFERENCES Picture (pictureID);
ALTER TABLE PlaylistItem ADD CONSTRAINT FKPlaylistIt900688 FOREIGN KEY (galerieID) REFERENCES Galerie (galerieID);
ALTER TABLE PlaylistItem ADD CONSTRAINT FKPlaylistIt414704 FOREIGN KEY (videoID) REFERENCES Video (videoID);
ALTER TABLE `Tag` ADD CONSTRAINT FKTag769710 FOREIGN KEY (parentTagID) REFERENCES `Tag` (tagID);
ALTER TABLE Tag_Video ADD CONSTRAINT FKTag_Video100621 FOREIGN KEY (tagID) REFERENCES `Tag` (tagID);
ALTER TABLE Tag_Video ADD CONSTRAINT FKTag_Video793173 FOREIGN KEY (videoID) REFERENCES Video (videoID);
ALTER TABLE Tag_Picture ADD CONSTRAINT FKTag_Pictur756803 FOREIGN KEY (tagID) REFERENCES `Tag` (tagID);
ALTER TABLE Tag_Picture ADD CONSTRAINT FKTag_Pictur899842 FOREIGN KEY (pictureID) REFERENCES Picture (pictureID);
ALTER TABLE Tag_Galerie ADD CONSTRAINT FKTag_Galeri473494 FOREIGN KEY (tagID) REFERENCES `Tag` (tagID);
ALTER TABLE Tag_Galerie ADD CONSTRAINT FKTag_Galeri23487 FOREIGN KEY (galerieID) REFERENCES Galerie (galerieID);
ALTER TABLE Tag_Playlist ADD CONSTRAINT FKTag_Playli639655 FOREIGN KEY (tagID) REFERENCES `Tag` (tagID);
ALTER TABLE Tag_Playlist ADD CONSTRAINT FKTag_Playli928982 FOREIGN KEY (playlistID) REFERENCES Playlist (playlistID);
ALTER TABLE Snippet ADD CONSTRAINT FKSnippet797654 FOREIGN KEY (sourceVideoID) REFERENCES Video (videoID);
ALTER TABLE Media ADD CONSTRAINT FKMedia54521 FOREIGN KEY (VideovideoID) REFERENCES Video (videoID);
ALTER TABLE Movie ADD CONSTRAINT FKMovie751549 FOREIGN KEY (videoID) REFERENCES Video (videoID);
ALTER TABLE Regisseur ADD CONSTRAINT FKRegisseur439607 FOREIGN KEY (celebrityID) REFERENCES Celebrity (celebrityID);
ALTER TABLE Regisseur ADD CONSTRAINT FKRegisseur587444 FOREIGN KEY (videoID) REFERENCES Video (videoID);
ALTER TABLE Actor ADD CONSTRAINT FKActor310071 FOREIGN KEY (videoID) REFERENCES Video (videoID);
ALTER TABLE Actor ADD CONSTRAINT FKActor634467 FOREIGN KEY (celebrityID) REFERENCES Celebrity (celebrityID);
ALTER TABLE Playlist_Name ADD CONSTRAINT FKPlaylist_N621281 FOREIGN KEY (playlistID) REFERENCES Playlist (playlistID);
ALTER TABLE Playlist_Name ADD CONSTRAINT FKPlaylist_N788121 FOREIGN KEY (nameID) REFERENCES Name (nameID);
ALTER TABLE Galerie_Name ADD CONSTRAINT FKGalerie_Na511740 FOREIGN KEY (galerieID) REFERENCES Galerie (galerieID);
ALTER TABLE Galerie_Name ADD CONSTRAINT FKGalerie_Na363546 FOREIGN KEY (nameID) REFERENCES Name (nameID);
ALTER TABLE Picture_Name ADD CONSTRAINT FKPicture_Na474753 FOREIGN KEY (pictureID) REFERENCES Picture (pictureID);
ALTER TABLE Picture_Name ADD CONSTRAINT FKPicture_Na70084 FOREIGN KEY (nameID) REFERENCES Name (nameID);
ALTER TABLE Tag_Name ADD CONSTRAINT FKTag_Name996331 FOREIGN KEY (tagID) REFERENCES `Tag` (tagID);
ALTER TABLE Tag_Name ADD CONSTRAINT FKTag_Name405466 FOREIGN KEY (nameID) REFERENCES Name (nameID);
ALTER TABLE Video_Name ADD CONSTRAINT FKVideo_Name690920 FOREIGN KEY (videoID) REFERENCES Video (videoID);
ALTER TABLE Video_Name ADD CONSTRAINT FKVideo_Name772666 FOREIGN KEY (nameID) REFERENCES Name (nameID);
ALTER TABLE Name_Celebrity ADD CONSTRAINT FKName_Celeb795349 FOREIGN KEY (nameID) REFERENCES Name (nameID);
ALTER TABLE Name_Celebrity ADD CONSTRAINT FKName_Celeb657192 FOREIGN KEY (celebrityID) REFERENCES Celebrity (celebrityID);
ALTER TABLE Celebrity_Picture ADD CONSTRAINT FKCelebrity_644879 FOREIGN KEY (celebrityID) REFERENCES Celebrity (celebrityID);
ALTER TABLE Celebrity_Picture ADD CONSTRAINT FKCelebrity_552584 FOREIGN KEY (pictureID) REFERENCES Picture (pictureID);
ALTER TABLE Celebrity_Tag ADD CONSTRAINT FKCelebrity_599311 FOREIGN KEY (celebrityID) REFERENCES Celebrity (celebrityID);
ALTER TABLE Celebrity_Tag ADD CONSTRAINT FKCelebrity_650055 FOREIGN KEY (tagID) REFERENCES `Tag` (tagID);
ALTER TABLE Artist ADD CONSTRAINT FKArtist16267 FOREIGN KEY (videoID) REFERENCES Video (videoID);
ALTER TABLE Artist ADD CONSTRAINT FKArtist10785 FOREIGN KEY (celebrityID) REFERENCES Celebrity (celebrityID);
ALTER TABLE Video_Variation ADD CONSTRAINT FKVideo_Vari467900 FOREIGN KEY (videoID) REFERENCES Video (videoID);
ALTER TABLE Video_Variation ADD CONSTRAINT FKVideo_Vari682682 FOREIGN KEY (variationID) REFERENCES Variation (variationID);
ALTER TABLE Variation_Name ADD CONSTRAINT FKVariation_812668 FOREIGN KEY (variationID) REFERENCES Variation (variationID);
ALTER TABLE Variation_Name ADD CONSTRAINT FKVariation_516342 FOREIGN KEY (nameID) REFERENCES Name (nameID);
ALTER TABLE Snippet ADD CONSTRAINT FKSnippet234387 FOREIGN KEY (videoID) REFERENCES Video (videoID);
ALTER TABLE Video ADD CONSTRAINT FKVideo716883 FOREIGN KEY (thumbnailPictureID) REFERENCES Picture (pictureID);
ALTER TABLE `Group` ADD CONSTRAINT FKGroup408549 FOREIGN KEY (parentGroupID) REFERENCES `Group` (groupID);
ALTER TABLE User_Group ADD CONSTRAINT FKUser_Group794586 FOREIGN KEY (userID) REFERENCES `User` (userID);
ALTER TABLE User_Group ADD CONSTRAINT FKUser_Group556566 FOREIGN KEY (groupID) REFERENCES `Group` (groupID);
ALTER TABLE Tag_Group ADD CONSTRAINT FKTag_Group674262 FOREIGN KEY (tagID) REFERENCES `Tag` (tagID);
ALTER TABLE Tag_Group ADD CONSTRAINT FKTag_Group936331 FOREIGN KEY (groupID) REFERENCES `Group` (groupID);
ALTER TABLE Celebrity ADD CONSTRAINT FKCelebrity11470 FOREIGN KEY (avatarPictureID) REFERENCES Picture (pictureID);
