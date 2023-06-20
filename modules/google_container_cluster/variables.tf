variable "project_id" {
  type        = string
  description = "GCP 專案 ID"
}

variable "cluster_name" {
  type        = string
  description = "GKE 名稱"
}

variable "cluster_location" {
  type        = string
  description = "GKE 區域"
}

variable "node_locations" {
  type        = list(string)
  description = "GKE 節點位置"
  default     = ["asia-east1-b"]
}

variable "cluster_version" {
  type        = string
  description = "GKE 版本" 
}

variable "network_name" {
  type        = string
  description = "GKE 網路名稱"
}

variable "subnetwork_name" {
  type        = string
  description = "GKE 子網路名稱"
}

variable "node_max_pods" {
  type        = number
  description = "GKE 每個節點的最大Pod數量"
  default     = 64
}

variable "remove_default_node_pool" {
  type    = bool
  description = "是否移除預設節點池"
  default = true
}

variable "initial_node_count" {
  type        = number
  description = "GKE 初始節點數量"
  default     = 1
}

variable "enable_shielded_nodes" {
  type    = bool
  description = "是否啟用 Shielded Nodes (安全加強型的節點)"
  default = false
}

variable "resource_labels" {
  type = map(string)
  description = "GKE 資源標籤"
}

variable "private_cluster_ipv4_cidr" {
  type        = string
  description = "GKE 控制層IP範圍"
}

variable "dns_enabled" {
  type        = bool
  description = "是否啟用 GKE 內建的 DNS"
  default     = false
}

variable "cluster_dns" {
  type        = string
  description = "GKE DNS 提供程序"
  default     = "PROVIDER_UNSPECIFIED"
  validation {
    condition     = contains(["PROVIDER_UNSPECIFIED", "PLATFORM_DEFAULT", "CLOUD_DNS"], var.cluster_dns)
    error_message = "不符合 DNS 提供程序的值，請輸入 PROVIDER_UNSPECIFIED 或 PLATFORM_DEFAULT 或 CLOUD_DNS"
  }
}

variable "cluster_dns_scope" {
  type        = string
  description = "GKE DNS 訪問範圍"
  default     = "DNS_SCOPE_UNSPECIFIED"
  validation {
    condition     = contains(["DNS_SCOPE_UNSPECIFIED", "CLUSTER_SCOPE", "VPC_SCOPE"], var.cluster_dns_scope)
    error_message = "不符合 DNS 訪問範圍的值，請輸入 DNS_SCOPE_UNSPECIFIED 或 CLUSTER_SCOPE 或 VPC_SCOPE"
  }  
}

variable "binary_authorization_enabled" {
  type        = bool
  description = "是否啟用 GKE 二進制授權"
  default     = false
}

variable "binary_authorization" {
  type        = string
  description = "GKE 二進制授權"
  default     = "DISABLED"
  validation {
    condition     = contains(["DISABLED", "PROJECT_SINGLETON_POLICY_ENFORCE"], var.binary_authorization)
    error_message = "不符合二進制授權的值，請輸入 DISABLED 或 PROJECT_SINGLETON_POLICY_ENFORCE"
  }  
}